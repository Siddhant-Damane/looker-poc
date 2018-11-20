view: next_events_list {

#   filter: event_to_view {
#     suggest_dimension: event_type
#     type: string
#   }

  derived_table: {
    sql: WITH event_table AS (
      SELECT base_table.drf_user_id as"base_table_drf_user_id",
                           TO_CHAR(CONVERT_TIMEZONE('UTC', 'America/New_York', (timestamp 'epoch' + (CAST(base_table.created_at_ms  AS BIGINT) / 1000) * interval '1 second')), 'YYYY-MM-DD HH24:MI:SS') AS public_prod_stream_table_created_at_ms_formatted_time,
                           TO_CHAR(CONVERT_TIMEZONE('UTC', 'America/New_York', (timestamp 'epoch' + (CAST(drf_play.created_at_ms  AS BIGINT) / 1000) * interval '1 second')), 'YYYY-MM-DD HH24:MI:SS') AS play_page_load_created_at_ms_formatted_time,
                           ((CAST(drf_play.created_at_ms  AS BIGINT) / 1000) - (CAST(base_table.created_at_ms  AS BIGINT) / 1000)) / 60 AS "play_page.time_difference",
                            base_table.event_type  AS event_type,
                            drf_play.event_type  AS "drf_play_event_type",
                            CAST(drf_play.created_at_ms  AS BIGINT) / 1000 AS drf_play_created_at_ms,
                            CAST(base_table.created_at_ms  AS BIGINT) / 1000 AS base_table_created_at_ms,
                            base_table.location_url  AS base_table_location_url
                          FROM public.prod_stream_table as base_table
                    INNER JOIN public.prod_stream_table AS drf_play ON base_table.drf_user_id = drf_play.drf_user_id
                    and drf_play.location_url like '%https://play.drf.com/%'
                    and base_table.location_url = 'https://play.drf.com/#/'
                    and base_table.event_type is not Null and drf_play.event_type is not Null
                    AND (((CAST(drf_play.created_at_ms  AS BIGINT) / 1000) - (CAST(base_table.created_at_ms  AS BIGINT) / 1000)) / 60) BETWEEN 0 AND 5
                    AND ((((CAST(base_table.created_at_ms  AS BIGINT) / 1000) >= (DATE_PART(epoch, TIMESTAMP '2018-11-01')::bigint) AND (CAST(base_table.created_at_ms  AS BIGINT) / 1000) < (DATE_PART(epoch, TIMESTAMP '2018-11-30')::bigint))))
                    GROUP BY 1,2,3,4,5,6,7,8,9
                    ORDER BY 1 DESC,2 ASC, 3 ASC
                    )

                    , event_1 AS

                    (SELECT event_table.base_table_drf_user_id as user_id
                           ,event_table.base_table_created_at_ms as stage_stream_table_created_at_ms
                           ,event_table.public_prod_stream_table_created_at_ms_formatted_time as stage_stream_table_created_at_ms_formatted_time
                           ,event_table.event_type as event_type
                           ,event_table.base_table_location_url as location_url
                           ,LAG(event_table.drf_play_event_type,1) over (partition by event_table.base_table_drf_user_id order by event_table.play_page_load_created_at_ms_formatted_time) first_action_after_click
                           ,LAG(event_table.drf_play_event_type,2) over (partition by event_table.base_table_drf_user_id order by event_table.play_page_load_created_at_ms_formatted_time) as second_action_after_click
                           ,LAG(event_table.drf_play_event_type,3) over (partition by event_table.base_table_drf_user_id order by event_table.play_page_load_created_at_ms_formatted_time) as third_action_after_click
                           ,LAG(event_table.drf_play_event_type,4) over (partition by event_table.base_table_drf_user_id order by event_table.play_page_load_created_at_ms_formatted_time) as fourth_action_after_click

                    FROM event_table
                    )

                    select event_1.user_id,event_1.event_type,event_1.location_url  from event_1
                    --where event_1.event_type = 'PAGE_LOAD' and event_1.location_url = 'https://play.drf.com/#/'

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
    label: "Event type"
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
      stage_stream_table_created_at_ms,
      stage_stream_table_created_at_ms_formatted_time,
      first_action_after_click,
      second_action_after_click,
      third_action_after_click,
      fourth_action_after_click
    ]
  }
}
