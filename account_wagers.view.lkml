view: account_wagers {
  sql_table_name: public.account_wagers ;;

  dimension: account_number {
    type: number
    sql: ${TABLE}.account_number ;;
  }

  dimension: credit_amt {
    type: number
    sql: ${TABLE}.credit_amt ;;
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

  dimension: place_refund_amt {
    type: number
    sql: ${TABLE}.place_refund_amt ;;
  }

  dimension: place_win_amt {
    type: number
    sql: ${TABLE}.place_win_amt ;;
  }

  dimension: pool {
    type: string
    sql: ${TABLE}.pool ;;
  }

  dimension: race {
    type: number
    sql: ${TABLE}.race ;;
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

  dimension: refund_amt {
    type: number
    sql: ${TABLE}.refund_amt ;;
  }

  dimension: runners {
    type: string
    sql: ${TABLE}.runners ;;
  }

  dimension: show_refund_amt {
    type: number
    sql: ${TABLE}.show_refund_amt ;;
  }

  dimension: show_win_amt {
    type: number
    sql: ${TABLE}.show_win_amt ;;
  }

  dimension: stake {
    type: number
    sql: ${TABLE}.stake ;;
  }

  dimension: total_bet_amt {
    type: number
    sql: ${TABLE}.total_bet_amt ;;
  }

  dimension: track {
    type: string
    sql: ${TABLE}.track ;;
  }

  dimension: wager_source {
    type: string
    sql: ${TABLE}.wager_source ;;
  }

  dimension: win_refund_amt {
    type: number
    sql: ${TABLE}.win_refund_amt ;;
  }

  dimension: win_win_amt {
    type: number
    sql: ${TABLE}.win_win_amt ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
