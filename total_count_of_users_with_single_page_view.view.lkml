# view: total_count_of_users_with_single_page_view {
#   # # You can specify the table name if it's different from the view name:
#   sql_table_name: public.prod_stream_table ;;
#   #
#   # # Define your dimensions and measures here, like this:
#
#
#   dimension: location_url {
#     description: "location_url"
#     type: string
#     sql: ${TABLE}.location_url ;;
#
#   }
#   #
#   # dimension: lifetime_orders {
#   #   description: "The total number of orders for each user"
#   #   type: number
#   #   sql: ${TABLE}.lifetime_orders ;;
#   # }
#   #
#   dimension: created_at {
#     description: "When the event happened"
#     type: string
#     sql: ${TABLE}.created_at ;;
#   }
#
#   dimension: created_at_ms {
#     type: number
#     sql: ${TABLE}.created_at_ms ;;
#   }
#
#   dimension_group: created_at_ms_formatted {
#     type: time
#     datatype: epoch
#     timeframes: [time, raw, date, week, month, year, hour_of_day]
#     sql: CAST(${created_at_ms} AS BIGINT) / 1000;;
#   }
#
#
#   dimension: device_model{
#     description: "device model"
#     type: string
#     sql: CASE
#         WHEN ${TABLE}.device = 'desktop' THEN 'desktop'
#         WHEN ${TABLE}.device = 'console' THEN 'console'
#         WHEN ${TABLE}.device = 'smarttv' THEN 'smarttv'
#         WHEN json_extract_path_text( ${TABLE}.device, 'type') != '' THEN json_extract_path_text(${TABLE}.device, 'type')
#         ELSE 'Device Unknown'
#         end;;
#   }
#
#   dimension: DRF_Customer_ID {
#     description: "DRF Customer ID"
#     type: string
#     sql:  ${TABLE}.drf_user_id ;;
#   }
#   dimension: event_type {
#     description: "DRF Customer ID"
#     type: string
#     sql:  ${TABLE}.event_type ;;
#   }
#
#   measure: max_event_type {
#     description: "DRF max event type"
#     type: max
#     sql:  ${event_type} ;;
#   }
#
#
#   measure: distinct_DRF_Customer_ID {
#     description: "count of user event"
#     type: count_distinct
#     sql: ${DRF_Customer_ID} ;;
#     drill_fields: []
#   }
#
#   measure: count_location_url {
#     description: "count of user event"
#     type: count
#     sql: ${location_url} ;;
#     drill_fields: []
#   }
#
# measure: count {
#   description: "count"
#   type: count
#   drill_fields: [detail*]
#
# }
#   set: detail {
#     fields: [DRF_Customer_ID,max_event_type]
#   }
# }
#


view: total_count_of_users_with_single_page_view {
  derived_table: {
    sql:
            select count(*) as user_count from (select count(public.prod_stream_table.drf_user_id) as user_id from public.prod_stream_table
            where public.prod_stream_table.location_url like 'https://play.drf.com/%' and public.prod_stream_table.drf_user_id is not Null
            group by  public.prod_stream_table.drf_user_id
            having count(public.prod_stream_table.location_url) = 1) as total_row_count
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_count {
    type: number
    sql: ${TABLE}.user_count ;;
  }

  set: detail {
    fields: [user_count]
  }
}
