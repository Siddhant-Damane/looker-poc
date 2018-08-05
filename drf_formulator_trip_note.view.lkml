view: drf_formulator_trip_note {
  sql_table_name: public.drf_formulator_trip_note ;;

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: day_evening {
    type: string
    sql: ${TABLE}.day_evening ;;
  }

  dimension_group: race {
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
    sql: ${TABLE}.race_date ;;
  }

  dimension: race_number {
    type: number
    sql: ${TABLE}.race_number ;;
  }

  dimension: registration_number {
    type: string
    sql: ${TABLE}.registration_number ;;
  }

  dimension: track_id {
    type: string
    sql: ${TABLE}.track_id ;;
  }

  dimension: trip_note {
    type: string
    sql: ${TABLE}.trip_note ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
