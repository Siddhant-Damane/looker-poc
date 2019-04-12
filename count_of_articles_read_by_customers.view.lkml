view: count_of_articles_read_by_customers {
  derived_table: {
    sql: SELECT registration_view.drf_user_id AS "registraton_view.drf_customer_id",
      count(distinct split_part(registration_view.location_url, '?type', 1)) AS "split_registration_view.location_url"

      FROM public.prod_stream_table  AS registration_view

      WHERE (registration_view.location_url LIKE '%/news/preview/%') AND ((split_part(registration_view.location_url, '?type', 1) is NOT NULL AND LENGTH(split_part(registration_view.location_url, '?type', 1)) <> 0) AND ((CAST(registration_view.created_at_ms AS BIGINT) / 1000 >= DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', TIMESTAMP '2019-01-01'))::bigint)))
      GROUP BY 1
      ORDER BY 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: registraton_view_drf_customer_id {
    type: number
    sql: ${TABLE}."registraton_view.drf_customer_id" ;;
  }

  dimension: split_registration_view_location_url {
    type: number
    sql: ${TABLE}."split_registration_view.location_url" ;;
  }

  set: detail {
    fields: [registraton_view_drf_customer_id, split_registration_view_location_url]
  }
}
