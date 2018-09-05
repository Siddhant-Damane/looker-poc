view: count_of_users_with_tracks {
  derived_table: {
    sql: select count(*) as user_count from (select
        registration_view.drf_user_id,
        count(distinct(rtrim(trim(registration_view.location_url, regexp_substr(registration_view.location_url,'https://play.drf.com/#/pp-details/[0-9]*/')),regexp_substr(trim(registration_view.location_url, regexp_substr(registration_view.location_url,'https://play.drf.com/#/pp-details/[0-9]*/')),'/[0-9]*/[A-Z]*/[A-Z]*'))))as "track"
          FROM public.prod_stream_table  AS registration_view

        WHERE
        (registration_view.location_url LIKE '%https://play.drf.com/#/pp-details/%') and drf_user_id is not Null

        group by 1)
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_count {
    type: number
    sql: ${TABLE}.user_count ;;
  }

  set: detail {
    fields: [user_count]
  }
}
