# view: drop_off_view {
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
#}

 view: drop_off_view {
#   # Or, you could make this view a derived table, like this:
  derived_table: {
    sql:SELECT * FROM ( WITH latest_event as (
      SELECT user_tracking_id, max(created_at_ms) latest_created_at
      FROM public.prod_stream_table WHERE (event_type = 'REGISTER_FIELD_BLUR') AND (application = 'DRF_REGISTRATION')
      GROUP BY user_tracking_id )
        SELECT pst.* FROM public.prod_stream_table pst, latest_event le
        WHERE le.user_tracking_id = pst.user_tracking_id AND pst.created_at_ms = le.latest_created_at
        AND (event_type = 'REGISTER_FIELD_BLUR') AND (application = 'DRF_REGISTRATION')
        AND NOT EXISTS (
          SELECT ipst.user_tracking_id FROM public.prod_stream_table ipst
          WHERE (ipst.event_type = 'REGISTER_CREATE_ACCOUNT'
            OR ipst.event_type = 'REGISTER_CREATE_GAMING_ACCOUNT' OR ipst.event_type = 'REGISTER_LOGIN' )
          AND ipst.user_tracking_id = pst.user_tracking_id ))
             ;;
  }

  dimension: form_field {
    description: "field clicked"
    type: string
    sql: json_extract_path_text(json_extract_array_element_text(${TABLE}.meta_data, 0, true), 'value', true) ;;
  }

  dimension: device_type{
    description: "type of device"
    type: string
    sql:CASE
          WHEN ${TABLE}.device = 'desktop'  THEN 'desktop'
          ELSE json_extract_path_text( ${TABLE}.device, 'type', true)
         END ;;
  }

  measure: form_field_count {
    description: "count of user event"
    type: count
    sql: ${TABLE}.user_tracking_id ;;
    drill_fields: []
  }
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }

}
