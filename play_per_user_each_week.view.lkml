view: user_count {

  derived_table: {
    sql:select  ss.drf_user_id, min(ss.created_at_ms),
                max(CASE WHEN ((((CAST(created_at_ms AS BIGINT) / 1000) >= ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(week,-2, DATE_TRUNC('week', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) )))::bigint))
                            AND (CAST(created_at_ms AS BIGINT) / 1000) < ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(week,1, DATEADD(week,-2, DATE_TRUNC('week', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) ) )))::bigint)))))THEN 1 ELSE 0 END) as priorSecondWeek,

                max(CASE WHEN ((((CAST(created_at_ms AS BIGINT) / 1000) >= ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(week,-1, DATE_TRUNC('week', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) )))::bigint)) AND
      (CAST(created_at_ms AS BIGINT) / 1000) < ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(week,1, DATEADD(week,-1, DATE_TRUNC('week', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) ) )))::bigint)))))THEN 1 ELSE 0 END)  as priorFirstWeek
                  from public.prod_stream_table as ss where ss.location_url like '%https://play.drf.com/%' and ss.drf_user_id is Not Null group by 1;;
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

  measure: two_weeks_ago {
    group_label: "Prior Week Measures"
    type: sum
    sql: ${TABLE}.priorSecondWeek ;;
  }
  measure: one_week_ago {
    group_label: "Prior Week Measures"
    type: sum
    sql: ${TABLE}.priorFirstWeek ;;
  }

}
