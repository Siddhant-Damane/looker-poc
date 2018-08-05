view: wager {
  sql_table_name: public.wager ;;

  dimension: wager_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.wager_id ;;
  }

  dimension: account_balance {
    type: number
    sql: ${TABLE}.account_balance ;;
  }

  dimension: additional_info {
    type: string
    sql: ${TABLE}.additional_info ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: audit_trail_id {
    type: string
    sql: ${TABLE}.audit_trail_id ;;
  }

  dimension: bet_cost {
    type: number
    sql: ${TABLE}.bet_cost ;;
  }

  dimension: bet_type {
    type: string
    sql: ${TABLE}.bet_type ;;
  }

  dimension_group: cancel_ts {
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
    sql: ${TABLE}.cancel_ts ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: drfbets_id {
    type: number
    sql: ${TABLE}.drfbets_id ;;
  }

  dimension: error_number {
    type: number
    sql: ${TABLE}.error_number ;;
  }

  dimension: fractional_percentage {
    type: number
    sql: ${TABLE}.fractional_percentage ;;
  }

  dimension: insert_ts {
    type: string
    sql: ${TABLE}.insert_ts ;;
  }

  dimension: number_of_bets {
    type: number
    sql: ${TABLE}.number_of_bets ;;
  }

  dimension: post_time {
    type: string
    sql: ${TABLE}.post_time ;;
  }

  dimension: program_name {
    type: string
    sql: ${TABLE}.program_name ;;
  }

  dimension: race {
    type: number
    sql: ${TABLE}.race ;;
  }

  dimension: runners {
    type: string
    sql: ${TABLE}.runners ;;
  }

  dimension: serial_number {
    type: number
    sql: ${TABLE}.serial_number ;;
  }

  dimension: track_id {
    type: string
    sql: ${TABLE}.track_id ;;
  }

  dimension: track_name {
    type: string
    sql: ${TABLE}.track_name ;;
  }

  measure: count {
    type: count
    drill_fields: [wager_id, program_name, track_name]
  }
}
