view: count_of_tracks_per_user {
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
    description: "DRF Customer ID"
    type: string
    sql:  ${TABLE}.event_type ;;
  }

#   measure:  {
#     description: "count of user event"
#     type: count_distinct
#     sql: ${DRF_Customer_ID} ;;
#     drill_fields: []
#   }

  measure: count_event_type {
    description: "count of user event"
    type: count
    sql: ${event_type} ;;
    drill_fields: []
  }

  measure: distinct_Location_URL {
    description: "average number of clicks"
    type: count_distinct
    sql: rtrim(trim(${location_url}, regexp_substr(${location_url},'https://play.drf.com/#/pp-details/[0-9]*/')),regexp_substr(trim(${location_url}, regexp_substr(${location_url},'https://play.drf.com/#/pp-details/[0-9]*/')),'/[0-9]*/[A-Z]*/[A-Z]*'));;
  }


}


# view: count_of_tracks_per_user {
#   derived_table: {
#     sql: select
#         registration_view.drf_user_id,
#         count(distinct(rtrim(trim(registration_view.location_url, regexp_substr(registration_view.location_url,'https://play.drf.com/#/pp-details/[0-9]*/')),regexp_substr(trim(registration_view.location_url, regexp_substr(registration_view.location_url,'https://play.drf.com/#/pp-details/[0-9]*/')),'/[0-9]*/[A-Z]*/[A-Z]*'))))as "track"
#           FROM public.prod_stream_table  AS registration_view
#
#         WHERE
#         (registration_view.location_url LIKE '%https://play.drf.com/#/pp-details/%') and drf_user_id is not Null
#
#         group by 1
#       LIMIT 500
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
#   dimension: track {
#     type: number
#     sql: ${TABLE}.track ;;
#   }
#
#   set: detail {
#     fields: [drf_user_id, track]
#   }
# }
