view: wager_view {
  sql_table_name: public.wager ;;

  dimension: wager_id {
    #label: ""
    primary_key: yes
    type: number
    sql: ${TABLE}.wager_id ;;
  }

  dimension: account_balance {
    #label: ""
    type: number
    sql: ${TABLE}.account_balance ;;
  }

  dimension: additional_info {
    #label: ""
    type: string
    sql: ${TABLE}.additional_info ;;
  }

  dimension: amount {
    #label: ""
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: audit_trail_id {
    #label: ""
    type: string
    sql: ${TABLE}.audit_trail_id ;;
  }

  dimension: bet_cost {
    #label: ""
    type: number
    sql: ${TABLE}.bet_cost ;;
  }

  dimension: bet_type {
    #label: ""
    type: string
    sql: ${TABLE}.bet_type ;;
  }

  dimension_group: cancel_ts {
    #label: ""
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
    #label: ""
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: drfbets_id {
    type: number
    sql: ${TABLE}.drfbets_id ;;
  }

  dimension: error_number {
    #label: ""
    type: number
    sql: ${TABLE}.error_number ;;
  }

  dimension: fractional_percentage {
    #label: ""
    type: number
    sql: ${TABLE}.fractional_percentage ;;
  }

  dimension: insert_ts {
    #label: ""
    type: string
    sql: ${TABLE}.insert_ts ;;
  }

  dimension: number_of_bets {
    #label: ""
    type: number
    sql: ${TABLE}.number_of_bets ;;
  }

  dimension: post_time {
    #label: ""
    type: string
    sql: ${TABLE}.post_time ;;
  }

  dimension: program_name {
    #label: ""
    type: string
    sql: ${TABLE}.program_name ;;
  }

  dimension: race {
    #label: ""
    type: number
    sql: ${TABLE}.race ;;
  }

  dimension: runners {
    #label: ""
    type: string
    sql: ${TABLE}.runners ;;
  }

  dimension: serial_number {
    #label: ""
    type: number
    sql: ${TABLE}.serial_number ;;
  }

  dimension: track_id {
    #label: ""
    type: string
    sql: ${TABLE}.track_id ;;
  }

  dimension: track_name {
    #label: ""
    type: string
    sql: ${TABLE}.track_name ;;
  }

  measure: count {
    type: count
    drill_fields: [wager_id, program_name, track_name]
  }
}
