view: uuid_2 {
  derived_table: {
    sql:
    select count(distinct user_tracking_id), DATE_TRUNC('week', CONVERT_TIMEZONE('UTC', 'America/New_York', (timestamp 'epoch' + CAST(created_at_ms AS BIGINT) / 1000 * interval '1 second'))) as "date"
    from prod_stream_table a
    where a.drf_user_id is null
    and a.user_tracking_id not in (
      select user_tracking_id
      from prod_stream_table b
      where b.drf_user_id is not null
    )
    and a.user_tracking_id not in (
      select user_tracking_id
      from (
        select user_tracking_id, count(*)
        from prod_stream_table
        group by user_tracking_id
        having count(*) = 1
      ) as "bounced"
    )
    and (((CAST(created_at_ms AS BIGINT) / 1000) >= ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(week,-20, DATE_TRUNC('week', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) )))::bigint)) AND (CAST(created_at_ms AS BIGINT) / 1000) < ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(week,20, DATEADD(week,-20, DATE_TRUNC('week', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) ) )))::bigint))))
    group by 2;;
  }

   measure: count {
    type: sum
    sql: ${TABLE}.count ;;

  }
  dimension: date {
    type: date_week
    convert_tz: no
    sql: ${TABLE}.date;;
  }


#   dimension_group: created_at_ms_formatted {
#     type: time
#     datatype: epoch
#     timeframes: [time, raw, date, week, month, year, hour_of_day]
#     sql: CAST(${created_at_ms} AS BIGINT) / 1000;;
#   }


  set: detail {
    fields: [count]
  }



}
