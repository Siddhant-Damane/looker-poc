view: count_of_articles_read_by_customers_in_2019 {
  derived_table: {
    sql: SELECT registration_view.drf_user_id AS "registration_view.drf_customer_id",
      split_part(registration_view.location_url, '?type', 1) AS "registration_view.unique_location_url"
      FROM public.prod_stream_table  AS registration_view

      WHERE (registration_view.location_url LIKE '%/news/preview/%') AND ((split_part(registration_view.location_url, '?type', 1) is NOT NULL AND LENGTH(split_part(registration_view.location_url, '?type', 1)) <> 0) AND ((CAST(registration_view.created_at_ms AS BIGINT) / 1000 >= DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', TIMESTAMP '2019-01-01'))::bigint)))
      GROUP BY 1,2
      ORDER BY 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: registration_view_drf_customer_id {
    type: number
    sql: ${TABLE}."registration_view.drf_customer_id" ;;
  }

  dimension: registration_view_unique_location_url {
    type: string
    sql: ${TABLE}."registration_view.unique_location_url" ;;
  }

  set: detail {
    fields: [registration_view_drf_customer_id, registration_view_unique_location_url]
  }
}
