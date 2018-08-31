view: user_funnel_view {
  derived_table: {
    sql: select
      ss.created_at as created_at,
      ss.created_at_ms as created_at_ms,
      ss.drf_user_id as drf_user_id,
      ss.event_type as event_type,
      ss.user_tracking_id as user_tracking_id,
      ss.xpb_user_id
      from public.prod_stream_table ss
      left join
      (select distinct user_tracking_id from public.prod_stream_table
            where user_tracking_id is not null) as drf_user_xref on drf_user_xref.user_tracking_id = ss.user_tracking_id

     where
        ss.created_at_ms  < (select top 1 created_at_ms from public.prod_stream_table where public.prod_stream_table.event_type  = 'REGISTER_CREATE_ACCOUNT' and public.prod_stream_table.user_tracking_id = ss.user_tracking_id)
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_at_ms {
    type: string
    sql: ${TABLE}.created_at_ms ;;
  }

  dimension: drf_user_id {
    type: number
    sql: ${TABLE}.drf_user_id ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: user_tracking_id {
    type: string
    sql: ${TABLE}.user_tracking_id ;;
  }

  dimension: xpb_user_id {
    type: string
    sql: ${TABLE}.xpb_user_id ;;
  }

  set: detail {
    fields: [
      created_at,
      created_at_ms,
      drf_user_id,
      event_type,
      user_tracking_id,
      xpb_user_id
    ]
  }
}
