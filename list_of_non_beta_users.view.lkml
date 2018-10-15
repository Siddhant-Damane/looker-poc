view: list_of_non_beta_users {

    derived_table: {
      sql: -- select count(s2.drf_user_id),s2.min from
              --(select  (s1.drf_user_id), MIN(DATE(CONVERT_TIMEZONE('UTC', 'America/New_York', (timestamp 'epoch' + CAST(s1.created_at_ms AS BIGINT) / 1000 * interval '1 second'))))
              --from public.prod_stream_table as s1
              --where (s1.drf_user_id) IN(

              (select public.prod_stream_table.drf_user_id,
              MIN(DATE(CONVERT_TIMEZONE('UTC', 'America/New_York', (timestamp 'epoch' + CAST(public.prod_stream_table.created_at_ms AS BIGINT) / 1000 * interval '1 second')))) as "min_non_beta_user_date"
                FROM public.prod_stream_table where public.prod_stream_table.location_url LIKE '%https://play.drf.com/%' AND public.prod_stream_table.drf_user_id IS NOT NULL AND
                 ((((CAST(public.prod_stream_table.created_at_ms AS BIGINT) / 1000) >= (DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', TIMESTAMP '2018-09-28'))::bigint)
                AND (CAST(public.prod_stream_table.created_at_ms AS BIGINT) / 1000) < (DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', TIMESTAMP '2018-12-31'))::bigint))))
                group by 1)

              minus

              (select present_play_user_not_in_beta.drf_user_id  AS "present_play_user_not_in_beta.drf_customer_id_1",
                MIN(DATE(CONVERT_TIMEZONE('UTC', 'America/New_York', (timestamp 'epoch' + CAST(present_play_user_not_in_beta.created_at_ms AS BIGINT) / 1000 * interval '1 second'))))
                FROM public.prod_stream_table  AS present_play_user_not_in_beta
                WHERE (present_play_user_not_in_beta.location_url LIKE '%https://play.drf.com/%') AND ((present_play_user_not_in_beta.drf_user_id IS NOT NULL))
                AND ((((CAST(present_play_user_not_in_beta.created_at_ms AS BIGINT) / 1000) >= (DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', TIMESTAMP '2018-08-30'))::bigint)
                AND (CAST(present_play_user_not_in_beta.created_at_ms AS BIGINT) / 1000) < (DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', TIMESTAMP '2018-09-28'))::bigint))))
                group by 1)



              --) and  s1.location_url LIKE '%https://play.drf.com/%' group by 1) --as s2 group by s2.min
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

  dimension: created_at {
    description: "When the event happened"
    type: string
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_at_ms {
    type: number
    sql: ${TABLE}.created_at_ms ;;
  }

  dimension_group: created_at_ms_formatted {
    type: time
    datatype: epoch
    convert_tz: no
    timeframes: [time, raw, date, week, month, year, hour_of_day]
    sql: CAST(${created_at_ms} AS BIGINT) / 1000;;
  }

  dimension: min_non_beta_user_date {
    type: date
    convert_tz: no

  }
  set: detail {
    fields: [drf_user_id, min_non_beta_user_date]
  }


 }
