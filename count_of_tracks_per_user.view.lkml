view: count_of_tracks_per_user {
  derived_table: {
    sql: select
        registration_view.drf_user_id,
        count(distinct(rtrim(trim(registration_view.location_url, regexp_substr(registration_view.location_url,'https://play.drf.com/#/pp-details/[0-9]*/')),regexp_substr(trim(registration_view.location_url, regexp_substr(registration_view.location_url,'https://play.drf.com/#/pp-details/[0-9]*/')),'/[0-9]*/[A-Z]*/[A-Z]*'))))as "track"
          FROM public.prod_stream_table  AS registration_view

        WHERE
        (registration_view.location_url LIKE '%https://play.drf.com/#/pp-details/%') and drf_user_id is not Null

        group by 1
      LIMIT 500
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

  dimension: track {
    type: number
    sql: ${TABLE}.track ;;
  }

  set: detail {
    fields: [drf_user_id, track]
  }
}
