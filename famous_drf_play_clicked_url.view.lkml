view: famous_drf_play_clicked_url {
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
    description: "DRF event Type"
    type: string
    sql:  ${TABLE}.event_type ;;
  }

  measure: distinct_DRF_event_type {
    description: "count distinct of user event"
    type: count_distinct
    sql: ${event_type} ;;
    drill_fields: []
  }

  measure: count_event_type {
    description: "count of user event"
    type: count
    sql: ${event_type} ;;
    drill_fields: []
  }



}


# view: famous_drf_play_clicked_url {
#   derived_table: {
#     sql: WITH famous_drf_play_clicked_url AS (select top 10 Distinct(ss.event_type), count(ss.event_type)
#       from public.prod_stream_table ss
#       where ss.location_url like 'https://play.drf.com/%'
#       group by 1
#       order by 2 desc
#
#       -- select top 10 ss.event_type, count(ss.event_type), ss.location_url, ss.drf_user_id
#       -- from public.prod_stream_table ss
#       -- where ss.location_url like 'https://play.drf.com/%' and ss.drf_user_id is not Null
#       -- group by 4,3,1
#       -- order by 2 desc
#        )
# SELECT
#   famous_drf_play_clicked_url.count  AS "famous_drf_play_clicked_url.count",
#   famous_drf_play_clicked_url.event_type  AS "famous_drf_play_clicked_url.event_type"
# FROM famous_drf_play_clicked_url
#
# GROUP BY 1,2
# ORDER BY 1 DESC
# LIMIT 500
#  ;;
#   }
#
#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }
#
#   dimension: famous_drf_play_clicked_url_count {
#     type: number
#     sql: ${TABLE}."famous_drf_play_clicked_url.count" ;;
#   }
#
#   dimension: famous_drf_play_clicked_url_event_type {
#     type: string
#     sql: ${TABLE}."famous_drf_play_clicked_url.event_type" ;;
#   }
#
#   set: detail {
#     fields: [famous_drf_play_clicked_url_count, famous_drf_play_clicked_url_event_type]
#   }
# }
