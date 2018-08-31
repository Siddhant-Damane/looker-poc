view: average_number_of_clicks_by_user {
  derived_table: {
    sql: select cast(((1.0 * count(ss.event_type))/count(distinct(ss.drf_user_id))) as decimal(8,2)) as average_number_of_clicks , ss.event_type
      from public.prod_stream_table ss
      where ss.location_url like 'https://play.drf.com/%' and ss.drf_user_id is not Null
      group by 2
      order by 1 desc

      -- select count(ss.event_type)
      -- from public.prod_stream_table ss
      -- where ss.location_url like 'https://play.drf.com/%' and ss.drf_user_id is not Null
      -- and ss.event_type = 'CLICK_ON_HORSE_NOTE'


      -- select count(distinct(ss.drf_user_id)) from public.prod_stream_table ss where ss.location_url like 'https://play.drf.com/%'  and ss.drf_user_id is not Null and  ss.event_type = 'CLICK_ON_HORSE_NOTE
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: average_number_of_clicks {
    type: number
    sql: ${TABLE}.average_number_of_clicks ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  set: detail {
    fields: [average_number_of_clicks, event_type]
  }
}
