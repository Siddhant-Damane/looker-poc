view: resolved_bet_view {
  sql_table_name: public.resolved_bet ;;

  dimension: id {
    #label: ""
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: credit_amount {
    #label: ""
    type: number
    sql: ${TABLE}.credit_amount ;;
  }

  dimension: drfbets_id {
    #label: ""
    type: number
    sql: ${TABLE}.drfbets_id ;;
  }

  dimension: pool_type {
    #label: ""
    type: string
    sql: ${TABLE}.pool_type ;;
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

  dimension: refund_amount {
    #label: ""
    type: number
    sql: ${TABLE}.refund_amount ;;
  }

  dimension: serial_number {
    #label: ""
    type: number
    sql: ${TABLE}.serial_number ;;
  }

  dimension: total_payout {
    #label: ""
    type: number
    sql: ${TABLE}.total_payout ;;
  }

  dimension: transaction_type {
    #label: ""
    type: string
    sql: ${TABLE}.transaction_type ;;
  }

  dimension: update_ts {
    #label: ""
    type: string
    sql: ${TABLE}.update_ts ;;
  }

  dimension: withholding_amount {
    #label: ""
    type: number
    sql: ${TABLE}.withholding_amount ;;
  }

  measure: count {
    type: count
    drill_fields: [id, program_name]
  }
}
