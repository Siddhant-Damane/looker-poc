view: play_event_count_by_user {
  derived_table: {
    sql: select distinct(ss.drf_user_id), count(ss.event_type) as total_drf_play_event
      from public.prod_stream_table ss
      where ss.location_url like 'https://play.drf.com/%' and ss.drf_user_id is not Null
      group by 1
      order by 2 desc
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

  dimension: total_drf_play_event {
    type: number
    sql: ${TABLE}.total_drf_play_event ;;
  }

  set: detail {
    fields: [drf_user_id, total_drf_play_event]
  }
}
