view: user_funnel_view {
  derived_table: {
    sql: select user_tracking_id,location_url,event_type,xpb_user_id,created_at_ms from public.prod_stream_table where user_tracking_id in
      (select user_tracking_id from public.prod_stream_table where xpb_user_id is Not Null) and created_at_ms <= (select top 1 created_at_ms from public.prod_stream_table where xpb_user_id is Not Null)
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_tracking_id {
    type: string
    sql: ${TABLE}.user_tracking_id ;;
  }

  dimension: location_url {
    type: string
    sql: ${TABLE}.location_url ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: xpb_user_id {
    type: string
    sql: ${TABLE}.xpb_user_id ;;
  }

  dimension: created_at_ms {
    type: string
    sql: ${TABLE}.created_at_ms ;;
  }

  set: detail {
    fields: [user_tracking_id, location_url, event_type, xpb_user_id, created_at_ms]
  }
}
