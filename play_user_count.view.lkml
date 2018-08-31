view: play_user_count {
  derived_table: {
    sql: SELECT COUNT(DISTINCT ss.drf_user_id) from public.prod_stream_table ss
       where ss.location_url like 'https://play.drf.com/%'
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
