view: sybase_prod_customer_sub {
  sql_table_name: public.sybase_prod_customer_sub ;;

  dimension: ask_about_auto_renew_ind {
    type: string
    sql: ${TABLE}.ask_about_auto_renew_ind ;;
  }

  dimension: cards_remaining {
    type: number
    sql: ${TABLE}.cards_remaining ;;
  }

  dimension: cost_price {
    type: number
    sql: ${TABLE}.cost_price ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: cybercash_approval_date {
    type: string
    sql: ${TABLE}.cybercash_approval_date ;;
  }

  dimension: cybercash_approval_number {
    type: number
    sql: ${TABLE}.cybercash_approval_number ;;
  }

  dimension: cybercash_submit_date {
    type: string
    sql: ${TABLE}.cybercash_submit_date ;;
  }

  dimension: race_date {
    type: string
    sql: ${TABLE}.race_date ;;
  }

  dimension: renew_subscription_indicator {
    type: string
    sql: ${TABLE}.renew_subscription_indicator ;;
  }

  dimension: sub_id {
    type: number
    sql: ${TABLE}.sub_id ;;
  }

  dimension: subscription_date {
    type: string
    sql: ${TABLE}.subscription_date ;;
  }

  dimension: subscription_expiration_date {
    type: string
    sql: ${TABLE}.subscription_expiration_date ;;
  }

  dimension: subscription_type_id {
    type: number
    sql: ${TABLE}.subscription_type_id ;;
  }

  dimension: video_type_id {
    type: number
    sql: ${TABLE}.video_type_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
