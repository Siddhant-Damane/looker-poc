view: users_not_beta_users {
  derived_table: {
    sql: (select public.prod_stream_table.drf_user_id
        FROM public.prod_stream_table where public.prod_stream_table.location_url LIKE '%https://play.drf.com/%' AND public.prod_stream_table.drf_user_id IS NOT NULL AND
         ((((CAST(public.prod_stream_table.created_at_ms AS BIGINT) / 1000) >= (DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', TIMESTAMP '2018-09-28'))::bigint) AND (CAST(public.prod_stream_table.created_at_ms AS BIGINT) / 1000) < (DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', TIMESTAMP '2018-10-02'))::bigint))))

       group by 1) minus
      (select present_play_user_not_in_beta.drf_user_id  AS "present_play_user_not_in_beta.drf_customer_id_1"
        FROM public.prod_stream_table  AS present_play_user_not_in_beta
        WHERE (present_play_user_not_in_beta.location_url LIKE '%https://play.drf.com/%') AND ((present_play_user_not_in_beta.drf_user_id IS NOT NULL)) AND ((((CAST(present_play_user_not_in_beta.created_at_ms AS BIGINT) / 1000) >= (DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', TIMESTAMP '2018-08-30'))::bigint) AND (CAST(present_play_user_not_in_beta.created_at_ms AS BIGINT) / 1000) < (DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', TIMESTAMP '2018-09-27'))::bigint)))) group by 1)


      -- not exists(

      --     )
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
