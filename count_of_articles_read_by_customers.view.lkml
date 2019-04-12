view: count_of_articles_read_by_customers {
  derived_table: {
    sql: SELECT
        registration_view.drf_user_id  AS "registration_view.drf_customer_id_1",
         split_part(registration_view.location_url, '?type', 1) AS "registration_view.unique_location_url",
        DATE(CONVERT_TIMEZONE('UTC', 'America/New_York', (timestamp 'epoch' + CAST(registration_view.created_at_ms AS BIGINT) / 1000 * interval '1 second'))) AS "registration_view.created_at_ms_formatted_date"
      FROM public.prod_stream_table  AS registration_view

      WHERE
        (registration_view.location_url LIKE '%/news/preview%') AND ((split_part(registration_view.location_url, '?type', 1) is NOT NULL AND LENGTH(split_part(registration_view.location_url, '?type', 1)) <> 0))
        group by 1,2,3
      ORDER BY 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: registration_view_drf_customer_id_1 {
    type: number
    sql: ${TABLE}."registration_view.drf_customer_id_1" ;;
  }

  dimension: registration_view_unique_location_url {
    type: string
    sql: ${TABLE}."registration_view.unique_location_url" ;;
  }

  dimension: registration_view_created_at_ms_formatted_date {
    type: date
    sql: ${TABLE}."registration_view.created_at_ms_formatted_date" ;;
  }

  set: detail {
    fields: [registration_view_drf_customer_id_1, registration_view_unique_location_url, registration_view_created_at_ms_formatted_date]
  }
}
