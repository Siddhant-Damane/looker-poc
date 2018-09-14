view: play_event_count_by_user {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: public.prod_stream_table ;;
  #
  # # Define your dimensions and measures here, like this:


  dimension: location_url {
    description: "location_url"
    type: string
    sql: ${TABLE}.location_url ;;

  }

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

  dimension: event_type {
    description: "DRF Event Type"
    type: string
    sql:  ${TABLE}.event_type ;;
  }

  measure: event_count {
    description: "DRF Event count"
    type: count
    sql:  ${event_type} ;;
  }

}


# view: play_event_count_by_user {
#   derived_table: {
#     sql: select distinct(ss.drf_user_id), count(ss.event_type) as total_drf_play_event
#       from public.prod_stream_table ss
#       where ss.location_url like 'https://play.drf.com/%' and ss.drf_user_id is not Null
#       group by 1
#       order by 2 desc
#        ;;
#   }
#
#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }
#
#   dimension: drf_user_id {
#     type: number
#     sql: ${TABLE}.drf_user_id ;;
#   }
#
#   dimension: total_drf_play_event {
#     type: number
#     sql: ${TABLE}.total_drf_play_event ;;
#   }
#
#   set: detail {
#     fields: [drf_user_id, total_drf_play_event]
#   }
# }
