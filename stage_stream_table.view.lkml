view: stage_stream_table {
  sql_table_name: public.stage_stream_table ;;

  dimension: application {
    type: string
    sql: ${TABLE}.application ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_at_ms {
    type: string
    sql: ${TABLE}.created_at_ms ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: drf_user_id {
    type: number
    sql: ${TABLE}.drf_user_id ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: location_url {
    type: string
    sql: ${TABLE}.location_url ;;
  }

  dimension: logged_in_status {
    type: string
    sql: ${TABLE}.logged_in_status ;;
  }

  dimension: meta_data {
    type: string
    sql: ${TABLE}.meta_data ;;
  }

  dimension: operating_system {
    type: string
    sql: ${TABLE}.operating_system ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: user_tracking_id {
    type: string
    sql: ${TABLE}.user_tracking_id ;;
  }

  dimension: xpb_user_id {
    type: string
    sql: ${TABLE}.xpb_user_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
