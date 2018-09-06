view: play_user_count {
  derived_table: {
    sql: SELECT DISTINCT ss.drf_user_id from public.prod_stream_table ss
       where ss.location_url like 'https://play.drf.com/%'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

 dimension: drf_user_id {
  type: string
  sql: ${TABLE}.drf_user_id ;;
}

  set: detail {
    fields: [drf_user_id]
  }

}
