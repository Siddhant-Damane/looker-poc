view: blc_customer {
  sql_table_name: public.blc_customer ;;

  dimension: archived {
    type: string
    sql: ${TABLE}.archived ;;
  }

  dimension: challenge_answer {
    type: string
    sql: ${TABLE}.challenge_answer ;;
  }

  dimension: challenge_question_id {
    type: number
    sql: ${TABLE}.challenge_question_id ;;
  }

  dimension: created_by {
    type: number
    sql: ${TABLE}.created_by ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: date_created {
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
    sql: ${TABLE}.date_created ;;
  }

  dimension_group: date_updated {
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
    sql: ${TABLE}.date_updated ;;
  }

  dimension: deactivated {
    type: number
    sql: ${TABLE}.deactivated ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: is_preview {
    type: number
    sql: ${TABLE}.is_preview ;;
  }

  dimension: is_registered {
    type: number
    sql: ${TABLE}.is_registered ;;
  }

  dimension: is_tax_exempt {
    type: number
    sql: ${TABLE}.is_tax_exempt ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: locale_code {
    type: string
    sql: ${TABLE}.locale_code ;;
  }

  dimension: password {
    type: string
    sql: ${TABLE}.password ;;
  }

  dimension: password_change_required {
    type: number
    sql: ${TABLE}.password_change_required ;;
  }

  dimension: receive_email {
    type: number
    sql: ${TABLE}.receive_email ;;
  }

  dimension: sndbx_archived_flag {
    type: string
    sql: ${TABLE}.sndbx_archived_flag ;;
  }

  dimension: sndbx_id {
    type: number
    sql: ${TABLE}.sndbx_id ;;
  }

  dimension: tax_exemption_code {
    type: string
    sql: ${TABLE}.tax_exemption_code ;;
  }

  dimension: updated_by {
    type: number
    sql: ${TABLE}.updated_by ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.user_name ;;
  }

  measure: count {
    type: count
    drill_fields: [user_name, last_name, first_name]
  }
}
