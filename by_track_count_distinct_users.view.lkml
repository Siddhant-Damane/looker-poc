view: by_track_count_distinct_users {
  derived_table: {
    sql: --trim(regexp_substr(trim(count_of_tracks_per_user.location_url, regexp_substr(count_of_tracks_per_user.location_url,'https://www.drf.com/pp-details/[0-9]*-[0-9]*-[0-9]*')),'[A-Z]*')) AS "track_id",
      SELECT

        trim(regexp_substr(trim(play_user_count.location_url, regexp_substr(play_user_count.location_url,'https://www.drf.com/pp-details/[0-9]*-[0-9]*-[0-9]*')),'[A-Z]*')) AS "track_id",
        COUNT(DISTINCT play_user_count.drf_user_id ) AS "drf_customer_id",
        max(DATE(CONVERT_TIMEZONE('UTC', 'America/New_York', (timestamp 'epoch' + CAST(play_user_count.created_at_ms AS BIGINT) / 1000 * interval '1 second')))) as "date"
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

  dimension: drf_customer_id {
    type: number
    sql: ${TABLE}.drf_customer_id;;
  }
  measure: count_drf_cust_id{
    type:  sum
    sql: ${TABLE}.drf_customer_id ;;
  }

  set: detail {
    fields: [track_id, drf_customer_id]
  }

  dimension: date {
    type: date
    convert_tz:no
  }

  dimension: week {
    convert_tz: no
    sql: TO_CHAR(DATE_TRUNC('week', ${date}), 'YYYY-MM-DD');;
  }

}
