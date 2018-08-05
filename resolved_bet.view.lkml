view: resolved_bet {
  sql_table_name: public.resolved_bet ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: credit_amount {
    type: number
    sql: ${TABLE}.credit_amount ;;
  }

  dimension: drfbets_id {
    type: number
    sql: ${TABLE}.drfbets_id ;;
  }

  dimension: pool_type {
    type: string
    sql: ${TABLE}.pool_type ;;
  }

  dimension: program_name {
    type: string
    sql: ${TABLE}.program_name ;;
  }

  dimension: race {
    type: number
    sql: ${TABLE}.race ;;
  }

  dimension: refund_amount {
    type: number
    sql: ${TABLE}.refund_amount ;;
  }

  dimension: serial_number {
    type: number
    sql: ${TABLE}.serial_number ;;
  }

  dimension: total_payout {
    type: number
    sql: ${TABLE}.total_payout ;;
  }

  dimension: transaction_type {
    type: string
    sql: ${TABLE}.transaction_type ;;
  }

  dimension: update_ts {
    type: string
    sql: ${TABLE}.update_ts ;;
  }

  dimension: withholding_amount {
    type: number
    sql: ${TABLE}.withholding_amount ;;
  }

  measure: count {
    type: count
    drill_fields: [id, program_name]
  }
}
