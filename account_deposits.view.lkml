view: account_deposits {
  sql_table_name: public.account_deposits ;;

  dimension: account_number {
    type: number
    sql: ${TABLE}.account_number ;;
  }

  dimension: action {
    type: string
    sql: ${TABLE}.action ;;
  }

  dimension: deposit_total {
    type: number
    sql: ${TABLE}.deposit_total ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
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
