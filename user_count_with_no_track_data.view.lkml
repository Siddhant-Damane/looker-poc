# view: user_count_with_no_track_data {
#   # # You can specify the table name if it's different from the view name:
#   sql_table_name: public.prod_stream_table ;;
#   #
#   # # Define your dimensions and measures here, like this:
#
#   dimension: location_url {
#     description: "location_url"
#     type: string
#     sql: ${TABLE}.location_url ;;
#
#   }
#   dimension: base_location_url {
#     description: "location_url"
#     type: yesno
#     sql: ${location_url} like 'https://play.drf.com/%';;
#
#   }
#
#   dimension: pp_details_location_url {
#     description: "pp details location_url"
#     type: yesno
#     sql: ${location_url} not like '%https://play.drf.com/#/pp-details/%' ;;
#
#   }
#   dimension: DRF_Customer_ID {
#     description: "DRF Customer ID"
#     type: string
#     sql:  ${TABLE}.drf_user_id ;;
#   }
#
#
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
#   measure: DRF_Customer_ID_with_pp_details {
#     description: "DRF Customer ID pp_details"
#     type: string
#     sql:  ${DRF_Customer_ID};;
#   }
#
#   measure: DRF_Customer_ID_with_play {
#     description: "DRF Customer ID play"
#     type: string
#     sql:  ${DRF_Customer_ID};;
#   }
#
#   measure: remaining_ids {
#     description: "Players with no pp data"
#     type: string
#     sql:  ${DRF_Customer_ID_with_play} - ${DRF_Customer_ID_with_pp_details};;
#   }
#
#   measure: Distinct_DRF_CUSTOMER_ID {
#     description: "DRF Customer ID"
#     type: count_distinct
#     sql:  ${TABLE}.drf_user_id ;;
#   }
#
# #   measure:  {
# #     description: "count of user event"
# #     type: count_distinct
# #     sql: ${DRF_Customer_ID} ;;
# #     drill_fields: []
# #   }
#
# #   measure: count_event_type {
# #     description: "count of user event"
# #     type: count
# #     sql: ${event_type} ;;
# #     drill_fields: []
# #   }
#
# #   measure: distinct_Location_URL {
# #     description: "average number of clicks"
# #     type: count_distinct
# #     sql: rtrim(trim(${location_url}, regexp_substr(${location_url},'https://play.drf.com/#/pp-details/[0-9]*/')),regexp_substr(trim(${location_url}, regexp_substr(${location_url},'https://play.drf.com/#/pp-details/[0-9]*/')),'/[0-9]*/[A-Z]*/[A-Z]*'));;
# #   }
#
#
# }


view: user_count_with_no_track_data {
#   filter:created_time_filter {
#     suggest_dimension: created_at_ms
#     type: number
#   }
  derived_table: {
    sql: (SELECT DISTINCT(ss.drf_user_id) from public.prod_stream_table ss where ss.location_url like 'https://play.drf.com/%' and drf_user_id is not Null ) MINUS (select Distinct(registration_view.drf_user_id) FROM public.prod_stream_table  AS registration_view
    WHERE (registration_view.location_url LIKE '%https://play.drf.com/#/pp-details/%') and drf_user_id is not Null)
      ;;
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

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: drf_user_id {
    type: number
    sql: ${TABLE}.drf_user_id ;;
  }

  set: detail {
    fields: [drf_user_id]
  }
}
