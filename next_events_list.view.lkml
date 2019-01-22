view: next_events_list {

  filter: event_to_view {
    suggest_dimension: event_type
    type: string
  }

  derived_table: {
    sql: WITH event_table AS (
      SELECT base_table.drf_user_id as base_table_drf_user_id,
                           TO_CHAR(CONVERT_TIMEZONE('UTC', 'America/New_York', (timestamp 'epoch' + (CAST(base_table.created_at_ms  AS BIGINT) / 1000) * interval '1 second')), 'YYYY-MM-DD HH24:MI:SS') AS public_prod_stream_table_created_at_ms_formatted_time,
                           TO_CHAR(CONVERT_TIMEZONE('UTC', 'America/New_York', (timestamp 'epoch' + (CAST(drf_play.created_at_ms  AS BIGINT) / 1000) * interval '1 second')), 'YYYY-MM-DD HH24:MI:SS') AS play_page_load_created_at_ms_formatted_time,
                           ((CAST(drf_play.created_at_ms  AS BIGINT) / 1000) - (CAST(base_table.created_at_ms  AS BIGINT) / 1000)) / 60 AS "play_page.time_difference",
                            base_table.event_type  AS event_type,
                            CASE
                              WHEN base_table.location_url LIKE 'play.drf.com%' THEN 'DRF Play'
                              ELSE 'Other'
                              END AS "base_table.location_url_bucket",
                            drf_play.event_type  AS "drf_play_event_type",
                            CAST(drf_play.created_at_ms  AS BIGINT) / 1000 AS drf_play_created_at_ms,
                            CAST(base_table.created_at_ms  AS BIGINT) / 1000 AS base_table_created_at_ms,
                            base_table.location_url  AS base_table_location_url
                          FROM public.prod_stream_table as base_table
                    INNER JOIN public.prod_stream_table AS drf_play ON base_table.drf_user_id = drf_play.drf_user_id and
                    CASE
                      WHEN (drf_play.location_url like '%play.drf.com%') THEN 'DRF play'
                      ELSE 'Other'
                      END != 'Other' and  {% condition event_to_view %} base_table.event_type {% endcondition %}
                    AND (((CAST(drf_play.created_at_ms  AS BIGINT) / 1000) - (CAST(base_table.created_at_ms  AS BIGINT) / 1000)) / 60) BETWEEN 0 AND 5
                     --AND ((((CAST(base_table.created_at_ms AS BIGINT) / 1000) >= ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', TIMESTAMP '2018-11-03'))::bigint)) AND (CAST(base_table.created_at_ms AS BIGINT) / 1000) < ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(day,1, TIMESTAMP '2018-11-03' )))::bigint)))))
                     --AND ((((CAST(drf_play.created_at_ms AS BIGINT) / 1000) >= ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', TIMESTAMP '2018-11-03'))::bigint)) AND (CAST(drf_play.created_at_ms AS BIGINT) / 1000) < ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(day,1, TIMESTAMP '2018-11-03' )))::bigint)))))
                    and ((((CAST(base_table.created_at_ms AS BIGINT) / 1000) >= ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))))::bigint))
                    AND (CAST(base_table.created_at_ms AS BIGINT) / 1000) < ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(day,1, DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE())) )))::bigint)))))
                    GROUP BY 1,2,3,4,5,6,7,8,9,10
                    ORDER BY 1 DESC,2 ASC, 3 ASC
                    )

                    , event_1 AS

                    (SELECT event_table.base_table_drf_user_id as user_id
                           ,event_table.base_table_created_at_ms as stage_stream_table_created_at_ms
                           ,event_table.public_prod_stream_table_created_at_ms_formatted_time as stage_stream_table_created_at_ms_formatted_time
                           ,event_table.event_type as event_type
                           ,LAG(event_table.drf_play_event_type,1) over (partition by event_table.base_table_drf_user_id order by event_table.play_page_load_created_at_ms_formatted_time) first_action_after_click
                           --,LAG(event_table.drf_play_event_type,2) over (partition by event_table.base_table_drf_user_id order by event_table.play_page_load_created_at_ms_formatted_time) as second_action_after_click
                           --,LAG(event_table.drf_play_event_type,3) over (partition by event_table.base_table_drf_user_id order by event_table.play_page_load_created_at_ms_formatted_time) as third_action_after_click
                           --,LAG(event_table.drf_play_event_type,4) over (partition by event_table.base_table_drf_user_id order by event_table.play_page_load_created_at_ms_formatted_time) as fourth_action_after_click

                    FROM event_table
                    )

                    select * from event_1
                    where {% condition event_to_view %} event_type {% endcondition %}
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: location_url {
    type: string
    sql: ${TABLE}.location_url ;;
  }

  dimension: stage_stream_table_created_at_ms {
    type: number
    sql: ${TABLE}.stage_stream_table_created_at_ms ;;
  }

  dimension: stage_stream_table_created_at_ms_formatted_time {
    type: string
    sql: ${TABLE}.stage_stream_table_created_at_ms_formatted_time ;;
  }

  dimension: event_type {
    label: "The Click"
    type: string
    sql: ${TABLE}.event_type ;;
  }
  measure: count_event_type {
    type: count
    sql: ${TABLE}.event_type ;;
  }

  dimension: first_action_after_click {
    type: string
    sql: ${TABLE}.first_action_after_click ;;
  }

  dimension: second_action_after_click {
    type: string
    sql: ${TABLE}.second_action_after_click ;;
  }

  dimension: third_action_after_click {
    type: string
    sql: ${TABLE}.third_action_after_click ;;
  }

  dimension: fourth_action_after_click {
    type: string
    sql: ${TABLE}.fourth_action_after_click ;;
  }

  set: detail {
    fields: [
      user_id,
      event_type,
      stage_stream_table_created_at_ms,
      stage_stream_table_created_at_ms_formatted_time,
      first_action_after_click,
      second_action_after_click,
      third_action_after_click,
      fourth_action_after_click
    ]
  }
}
