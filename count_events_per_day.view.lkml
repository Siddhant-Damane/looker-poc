view: count_events_per_day {
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

  dimension: event_type {
    description: "event_type"
    type: string
    sql:  ${TABLE}.event_type ;;
  }

  measure: count_events {
    description: "count of user event"
    type: count
    sql: ${event_type} ;;
    drill_fields: []
  }


}



# view: count_events_per_day {
#   derived_table: {
#     sql: select count(ss.event_type) as total_events, DATE(CONVERT_TIMEZONE('UTC', 'America/New_York', (timestamp 'epoch' + CAST(ss.created_at_ms AS BIGINT) / 1000 * interval '1 second'))) AS "formatted_date" from public.prod_stream_table ss where ss.location_url like 'https://play.drf.com/%' group by 2
#       ;;
#   }
#
#   dimension: total_events {
#     type: number
#     sql: ${TABLE}.total_events ;;
#   }
#
#   dimension: formatted_date {
#     type: date
#     sql: ${TABLE}."formatted_date" ;;
#   }
#
#   set: detail {
#     fields: [total_events, formatted_date]
#   }
# }
