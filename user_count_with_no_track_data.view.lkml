view: user_count_with_no_track_data {
  derived_table: {
    sql: (SELECT DISTINCT(ss.drf_user_id) from public.prod_stream_table ss where ss.location_url like 'https://play.drf.com/%' and drf_user_id is not Null) MINUS (select Distinct(registration_view.drf_user_id) FROM public.prod_stream_table  AS registration_view WHERE (registration_view.location_url LIKE '%https://play.drf.com/#/pp-details/%') and drf_user_id is not Null)
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: drf_user_id {
    type: number
    sql: ${TABLE}.drf_user_id ;;
  }

  set: detail {
    fields: [drf_user_id]
  }
}
