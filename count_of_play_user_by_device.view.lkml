view: count_of_play_user_by_device {
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

    measure: distinct_DRF_Customer_ID {
      description: "count of user event"
      type: count_distinct
      sql: ${DRF_Customer_ID} ;;
      drill_fields: []
    }

  dimension: DRF_xpb_id {
    description: "DRF Customer ID"
    type: string
    sql:  ${TABLE}.xpb_user_id ;;
  }

  measure: distinct_DRF_xpb_id {
    description: "count of user event"
    type: count_distinct
    sql: ${DRF_xpb_id} ;;
    drill_fields: []
  }

  dimension: event_type {
    description: "Event Type"
    type:  string
    sql: ${TABLE}.event_type;;
  }

measure: count_event_count {
  description: "count of user event"
  type: count
  sql: ${event_type} ;;
  drill_fields: []
}
}

# view: count_of_play_user_by_device {
#   derived_table: {
#     sql: SELECT CASE
#         WHEN ss.device = 'desktop' THEN 'desktop'
#         WHEN ss.device = 'console' THEN 'console'
#         WHEN ss.device = 'smarttv' THEN 'smarttv'
#         WHEN json_extract_path_text(ss.device, 'type') != '' THEN json_extract_path_text(ss.device, 'type')
#         ELSE 'Device Unknown'
#       END  AS "device_model",
#
# count(DISTINCT(ss.drf_user_id)) as drf_play_user_count
# from public.prod_stream_table ss
# where ss.location_url like 'https://play.drf.com/%'
# group by 1
# order by 1
#  ;;
#   }
#
#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }
#
#   dimension: device_model {
#     type: string
#     sql: ${TABLE}."device_model" ;;
#   }
#
#   dimension: drf_play_user_count {
#     type: number
#     sql: ${TABLE}.drf_play_user_count ;;
#   }
#
#   set: detail {
#     fields: [device_model, drf_play_user_count]
#   }
# }
