view: drf_formulator_horse_note {
  sql_table_name: public.drf_formulator_horse_note ;;

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: horse_note {
    type: string
    sql: ${TABLE}.horse_note ;;
  }

  dimension: registration_number {
    type: string
    sql: ${TABLE}.registration_number ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
