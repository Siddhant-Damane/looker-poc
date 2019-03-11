view: uuid_1 {
  derived_table: {
    sql:
      select count(distinct user_tracking_id),created_at_ms
      from prod_stream_table a
      where a.drf_user_id is null
      and a.user_tracking_id not in (
        select user_tracking_id
        from prod_stream_table b
        where b.drf_user_id is not null
      )
      group by 2
       ;;
  }

  measure: count {
    type: sum
    sql: ${TABLE}.count ;;
  }
   dimension: created_at_ms {
    type: number
    sql: ${TABLE}.created_at_ms;;
  }

  dimension_group: created_at_ms_formatted {
    type: time
    datatype: epoch
    timeframes: [time, raw, date, week, month, year, hour_of_day]
    sql: CAST(${created_at_ms} AS BIGINT) / 1000;;
  }


  set: detail {
    fields: [count]
  }

}
