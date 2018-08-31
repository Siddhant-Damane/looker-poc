view: famous_drf_play_clicked_url {
  derived_table: {
    sql: WITH famous_drf_play_clicked_url AS (select top 10 Distinct(ss.event_type), count(ss.event_type)
      from public.prod_stream_table ss
      where ss.location_url like 'https://play.drf.com/%'
      group by 1
      order by 2 desc

      -- select top 10 ss.event_type, count(ss.event_type), ss.location_url, ss.drf_user_id
      -- from public.prod_stream_table ss
      -- where ss.location_url like 'https://play.drf.com/%' and ss.drf_user_id is not Null
      -- group by 4,3,1
      -- order by 2 desc
       )
SELECT
  famous_drf_play_clicked_url.count  AS "famous_drf_play_clicked_url.count",
  famous_drf_play_clicked_url.event_type  AS "famous_drf_play_clicked_url.event_type"
FROM famous_drf_play_clicked_url

GROUP BY 1,2
ORDER BY 1 DESC
LIMIT 500
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: famous_drf_play_clicked_url_count {
    type: number
    sql: ${TABLE}."famous_drf_play_clicked_url.count" ;;
  }

  dimension: famous_drf_play_clicked_url_event_type {
    type: string
    sql: ${TABLE}."famous_drf_play_clicked_url.event_type" ;;
  }

  set: detail {
    fields: [famous_drf_play_clicked_url_count, famous_drf_play_clicked_url_event_type]
  }
}
