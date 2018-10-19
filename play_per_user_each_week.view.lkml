view: play_per_user_each_week {

  derived_table: {

    sql:select  ss.drf_user_id, ss.created_at_ms  as "min_non_beta_user_date"
                  from public.prod_stream_table as ss where ss.location_url like '%https://play.drf.com/%' and ss.drf_user_id is Not Null group by 2,1;;
  }

  dimension: drf_user_id {
    type: string
    sql: ${TABLE}.drf_user_id ;;
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
    convert_tz: no
    timeframes: [time, raw, date, week, month, year, hour_of_day]
    sql: CAST(${created_at_ms} AS BIGINT) / 1000;;
  }

#   dimension: distict_user_id {
#     type: number
#     sql: distinct ${drf_user_id} ;;
#
#   }
  dimension: min_non_beta_user_date {
    type: number
    convert_tz: no
  }

  measure: min_non_beta_user_date_two_week {
    type: number
    convert_tz: no
    sql:max(CASE WHEN (((CAST(${min_non_beta_user_date} AS BIGINT) / 1000) >= ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(day,-13, DATE_TRUNC('day', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) )))::bigint))
                  AND ((CAST(${min_non_beta_user_date} AS BIGINT) / 1000) < ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(day,14, DATEADD(day,-13, DATE_TRUNC('day', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) ) )))::bigint))
                  ))) THEN 1 ELSE 0 END);;
  }

  measure: min_non_beta_user_date_one_week {
    type: number
    convert_tz: no
    sql:max(CASE WHEN (((CAST(${min_non_beta_user_date} AS BIGINT) / 1000) >= ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(day,-6, DATE_TRUNC('day', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) )))::bigint))
                  AND ((CAST(${min_non_beta_user_date} AS BIGINT) / 1000) < ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(day,7, DATEADD(day,-6, DATE_TRUNC('day', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) ) )))::bigint))
                  ))) THEN 1 ELSE 0 END);;
  }


}
