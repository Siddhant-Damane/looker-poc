view: by_track_count_distinct_users {
  derived_table: {
    sql: --trim(regexp_substr(trim(count_of_tracks_per_user.location_url, regexp_substr(count_of_tracks_per_user.location_url,'https://www.drf.com/pp-details/[0-9]*-[0-9]*-[0-9]*')),'[A-Z]*')) AS "track_id",
      SELECT

        trim(regexp_substr(trim(play_user_count.location_url, regexp_substr(play_user_count.location_url,'https://www.drf.com/pp-details/[0-9]*-[0-9]*-[0-9]*')),'[A-Z]*')) AS "track_id",
        COUNT(DISTINCT play_user_count.drf_user_id ) AS "play_user_count.distinct_drf_customer_id_1"
      FROM public.prod_stream_table  AS play_user_count

      WHERE (play_user_count.location_url LIKE 'https://www.drf.com/pp-details%') AND ((play_user_count.event_type = 'CLICK_ON_HORSE_NOTE') AND ((play_user_count.event_type IS NOT NULL))) AND ((CAST(play_user_count.created_at_ms AS BIGINT) / 1000 >= DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', TIMESTAMP '2018-12-31'))::bigint)) AND ((((CAST(play_user_count.created_at_ms AS BIGINT) / 1000) >= ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(week,-1, DATE_TRUNC('week', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) )))::bigint)) AND (CAST(play_user_count.created_at_ms AS BIGINT) / 1000) < ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(week,1, DATEADD(week,-1, DATE_TRUNC('week', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) ) )))::bigint))))) AND ((play_user_count.drf_user_id IS NOT NULL))
      GROUP BY 1
      ORDER BY 2 DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: track_id {
    type: string
    sql: ${TABLE}.track_id ;;
  }

  dimension: play_user_count_distinct_drf_customer_id_1 {
    type: number
    sql: ${TABLE}."play_user_count.distinct_drf_customer_id_1" ;;
  }

  set: detail {
    fields: [track_id, play_user_count_distinct_drf_customer_id_1]
  }
}
