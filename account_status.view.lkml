view: account_status {
  sql_table_name: public.account_status ;;

  dimension: account_number {
    type: number
    sql: ${TABLE}.account_number ;;
  }

  dimension: account_status {
    type: string
    sql: ${TABLE}.account_status ;;
  }

  dimension_group: loaded {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.loaded_date ;;
  }

  dimension_group: race {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.race_date ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
