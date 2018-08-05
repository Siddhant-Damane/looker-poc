view: drf_horse_watch {
  sql_table_name: public.drf_horse_watch ;;

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: date_created {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date_created ;;
  }

  dimension: email_indicator {
    type: string
    sql: ${TABLE}.email_indicator ;;
  }

  dimension: entry_indicator {
    type: string
    sql: ${TABLE}.entry_indicator ;;
  }

  dimension: horse_name {
    type: string
    sql: ${TABLE}.horse_name ;;
  }

  dimension: registration_number {
    type: string
    sql: ${TABLE}.registration_number ;;
  }

  dimension: result_indicator {
    type: string
    sql: ${TABLE}.result_indicator ;;
  }

  dimension: watch_id {
    type: number
    sql: ${TABLE}.watch_id ;;
  }

  dimension: watch_notes {
    type: string
    sql: ${TABLE}.watch_notes ;;
  }

  dimension: workout_indicator {
    type: string
    sql: ${TABLE}.workout_indicator ;;
  }

  measure: count {
    type: count
    drill_fields: [horse_name]
  }
}
