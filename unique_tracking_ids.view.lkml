view: unique_tracking_ids {
  derived_table: {
    sql:
      select sum(count) from (
      (select count(*) from (select prod_stream_table.drf_user_id,count(prod_stream_table.user_tracking_id),min(prod_stream_table.created_at_ms) from prod_stream_table where prod_stream_table.drf_user_id is not null group by 1) as M)
      union
      (select count(*) from(select prod_stream_table.user_tracking_id,min(prod_stream_table.created_at_ms) from prod_stream_table where prod_stream_table.drf_user_id is null group by 1 ) as N)
    )


       ;;
  }

  dimension: count {
    type: number
    sql: ${TABLE}.count ;;
  }

  set: detail {
    fields: [count]
  }
}
