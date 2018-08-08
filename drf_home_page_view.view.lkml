view: drf_home_page_view {

  sql_table_name: public.prod_stream_table ;;

  dimension: event_type {
    description: "type of user event"
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: location_url {
    description: "location_url"
    type: string
    sql: ${TABLE}.location_url ;;
  }

  dimension: created_at {
    description: "When the event happened"
    type: string
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_at_ms {
    type: number
    sql: ${TABLE}.created_at_ms ;;
  }

  dimension: user_tracking_id {
    type: string
    sql: ${TABLE}.user_tracking_id ;;
  }

  dimension: application {
    type: string
    sql: ${TABLE}.application ;;
  }

  dimension: logged_in_status {
    type: string
    sql: ${TABLE}.logged_in_status ;;
  }

  dimension_group: created_at_ms_formatted {
    type: time
    datatype: epoch
    timeframes: [time, raw, date, week, month, year, hour_of_day]
    sql: CAST(${created_at_ms} AS BIGINT) / 1000;;
  }

  measure: event_count {
    description: "count of user event"
    type: count
    sql: ${event_type} ;;
    drill_fields: []
  }

  measure: distinct_event_count {
    description: "count of user event"
    type: count_distinct
    sql: ${event_type} ;;
    drill_fields: []
  }

  measure: distinct_user_tracking_id_count {
    description: "count of user tracking id"
    type: count_distinct
    sql: ${user_tracking_id} ;;
    drill_fields: []
  }

  dimension: meta_data {
    description: "App specific event meta data"
    type: string
    sql: ${TABLE}.meta_data ;;
  }

  dimension: form_field {
    description: "field clicked"
    type: string
    sql: json_extract_path_text(json_extract_array_element_text(${TABLE}.meta_data, 0, true), 'value', true) ;;
  }

}
