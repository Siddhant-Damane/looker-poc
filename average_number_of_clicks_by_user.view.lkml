
view: average_number_of_clicks_by_user {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: public.prod_stream_table ;;
  #
  # # Define your dimensions and measures here, like this:


  dimension: location_url {
    description: "location_url"
    type: string
    sql: ${TABLE}.location_url ;;

  }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  dimension: created_at {
    description: "When the event happened"
    type: string
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_at_ms {
    type: number
    sql: ${TABLE}.created_at_ms ;;
  }

  dimension_group: created_at_ms_formatted {
    type: time
    datatype: epoch
    timeframes: [time, raw, date, week, month, year, hour_of_day]
    sql: CAST(${created_at_ms} AS BIGINT) / 1000;;
  }


  dimension: device_model{
    description: "device model"
    type: string
    sql: CASE
        WHEN ${TABLE}.device = 'desktop' THEN 'desktop'
        WHEN ${TABLE}.device = 'console' THEN 'console'
        WHEN ${TABLE}.device = 'smarttv' THEN 'smarttv'
        WHEN json_extract_path_text( ${TABLE}.device, 'type') != '' THEN json_extract_path_text(${TABLE}.device, 'type')
        ELSE 'Device Unknown'
        end;;
  }

  dimension: DRF_Customer_ID {
    description: "DRF Customer ID"
    type: string
    sql:  ${TABLE}.drf_user_id ;;
  }
  dimension: event_type {
    order_by_field: average_number_of_clicks
    description: "DRF Customer ID"
    type: string
    sql:  ${TABLE}.event_type ;;
  }

  measure: distinct_DRF_Customer_ID {
    description: "count of user event"
    type: count_distinct
    sql: ${DRF_Customer_ID} ;;
    drill_fields: []
  }

  measure: count_event_type {

    description: "count of user event"
    type: count
    sql: ${event_type} ;;
    drill_fields: []
  }

  measure: average_number_of_clicks {
    type: number
    description: "average number of clicks"
    sql: cast(( (1.0 * ${count_event_type}) /(${distinct_DRF_Customer_ID})) as decimal(8,2));;
  }


}



# view: average_number_of_clicks_by_user {
#   derived_table: {
#     sql: select cast(((1.0 * count(ss.event_type))/count(distinct(ss.drf_user_id))) as decimal(8,2)) as average_number_of_clicks , ss.event_type
#       from public.prod_stream_table ss
#       where ss.location_url like 'https://play.drf.com/%' and ss.drf_user_id is not Null
#       group by 2
#       order by 1 desc
#
#       -- select count(ss.event_type)
#       -- from public.prod_stream_table ss
#       -- where ss.location_url like 'https://play.drf.com/%' and ss.drf_user_id is not Null
#       -- and ss.event_type = 'CLICK_ON_HORSE_NOTE'
#
#
#       -- select count(distinct(ss.drf_user_id)) from public.prod_stream_table ss where ss.location_url like 'https://play.drf.com/%'  and ss.drf_user_id is not Null and  ss.event_type = 'CLICK_ON_HORSE_NOTE
#        ;;
#   }
#
#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }
#
#   dimension: average_number_of_clicks {
#     type: number
#     sql: ${TABLE}.average_number_of_clicks ;;
#   }
#
#   dimension: event_type {
#     type: string
#     sql: ${TABLE}.event_type ;;
#   }
#
#   dimension: drf_user_id {
#     type: string
#     sql: ${TABLE}.drf_user_id ;;
#   }
#
#   set: detail {
#     fields: [average_number_of_clicks, event_type,drf_user_id]
#   }
# }
