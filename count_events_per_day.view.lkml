view: count_events_per_day {
  derived_table: {
    sql: select count(ss.event_type) as total_events, DATE(CONVERT_TIMEZONE('UTC', 'America/New_York', (timestamp 'epoch' + CAST(ss.created_at_ms AS BIGINT) / 1000 * interval '1 second'))) AS "formatted_date" from public.prod_stream_table ss where ss.location_url like 'https://play.drf.com/%' group by 2
      ;;
  }

  dimension: total_events {
    type: number
    sql: ${TABLE}.total_events ;;
  }

  dimension: formatted_date {
    type: date
    sql: ${TABLE}."formatted_date" ;;
  }

  set: detail {
    fields: [total_events, formatted_date]
  }
}
