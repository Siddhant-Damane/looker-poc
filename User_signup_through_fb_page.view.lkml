view: user_signup_through_fb_page {
  derived_table: {
    sql:select public.prod_stream_table.drf_user_id from public.prod_stream_table where public.prod_stream_table.user_tracking_id in (SELECT play_user_count.user_tracking_id
          FROM public.prod_stream_table  AS play_user_count
          WHERE play_user_count.location_url LIKE '%promos.drf.com/fb%' AND play_user_count.event_type = 'PAGE_LOAD'
          group by play_user_count.user_tracking_id
          HAVING min(play_user_count.created_at_ms)  <
          (select max(play_user_count2.created_at_ms) FROM public.prod_stream_table  AS play_user_count2
          where (play_user_count2.event_type = 'BETS_REGISTRATION_APPROVE' OR play_user_count2.event_type = 'BETS_REGISTRATION_NOT_APPROVE')
          AND play_user_count2.user_tracking_id =  play_user_count.user_tracking_id group by play_user_count2.user_tracking_id))
          and public.prod_stream_table.drf_user_id is not Null
          and
            (((CAST( public.prod_stream_table.created_at_ms AS BIGINT) / 1000) >= (DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', TIMESTAMP '2018-09-07'))::bigint) AND (CAST( public.prod_stream_table.created_at_ms AS BIGINT) / 1000) < (DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', TIMESTAMP '2018-09-23'))::bigint)))
          group by public.prod_stream_table.drf_user_id;;

    }

    dimension: DRF_Customer_ID {
      description: "DRF Customer ID"
      type: string
      sql: ${TABLE}.drf_user_id ;;
    }


  }
