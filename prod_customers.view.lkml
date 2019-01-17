view: prod_customers {
  sql_table_name: public.prod_customers ;;

  dimension_group: account_create {
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
    sql: ${TABLE}.account_create_date ;;
  }

  dimension: account_disable {
    type: string
    sql: ${TABLE}.account_disable ;;
  }

  dimension: account_disable_comment {
    type: string
    sql: ${TABLE}.account_disable_comment ;;
  }

  dimension_group: account_disable {
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
    sql: ${TABLE}.account_disable_date ;;
  }

  dimension: address_line1 {
    type: string
    sql: ${TABLE}.address_line1 ;;
  }

  dimension: address_line2 {
    type: string
    sql: ${TABLE}.address_line2 ;;
  }

  dimension: affiliate_customer_id {
    type: string
    sql: ${TABLE}.affiliate_customer_id ;;
  }

  dimension: affiliate_id {
    type: string
    sql: ${TABLE}.affiliate_id ;;
  }

  dimension_group: auto_billing {
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
    sql: ${TABLE}.auto_billing_date ;;
  }

  dimension: auto_process_indicator {
    type: string
    sql: ${TABLE}.auto_process_indicator ;;
  }

  dimension_group: auto_process_timestamp {
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
    sql: ${TABLE}.auto_process_timestamp ;;
  }

  dimension: bad_phone_number_ind {
    type: string
    sql: ${TABLE}.bad_phone_number_ind ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }

  dimension: call_comments {
    type: string
    sql: ${TABLE}.call_comments ;;
  }

  dimension: call_history {
    type: string
    sql: ${TABLE}.call_history ;;
  }

  dimension: cc_expiration_date {
    type: string
    sql: ${TABLE}.cc_expiration_date ;;
  }

  dimension: cc_name {
    type: string
    sql: ${TABLE}.cc_name ;;
  }

  dimension: cc_type {
    type: string
    sql: ${TABLE}.cc_type ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: comp_account_department {
    type: string
    sql: ${TABLE}.comp_account_department ;;
  }

  dimension: comp_account_description {
    type: string
    sql: ${TABLE}.comp_account_description ;;
  }

  dimension: comp_account_ind {
    type: string
    sql: ${TABLE}.comp_account_ind ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: credit_towards_products {
    type: string
    sql: ${TABLE}.credit_towards_products ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: cybercash_expiration {
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
    sql: ${TABLE}.cybercash_expiration_date ;;
  }

  dimension_group: date_of_birth {
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
    sql: ${TABLE}.date_of_birth ;;
  }

  dimension: discount_comment {
    type: string
    sql: ${TABLE}.discount_comment ;;
  }

  dimension: discount_disable {
    type: string
    sql: ${TABLE}.discount_disable ;;
  }

  dimension: discount_in_pct {
    type: string
    sql: ${TABLE}.discount_in_pct ;;
  }

  dimension: do_not_call_ind {
    type: string
    sql: ${TABLE}.do_not_call_ind ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension_group: email_verification {
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
    sql: ${TABLE}.email_verification_date ;;
  }

  dimension: email_verification_ind {
    type: string
    sql: ${TABLE}.email_verification_ind ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: hash_method {
    type: string
    sql: ${TABLE}.hash_method ;;
  }

  dimension: hco_transition_balance {
    type: string
    sql: ${TABLE}.hco_transition_balance ;;
  }

  dimension: home_phone_no {
    type: string
    sql: ${TABLE}.home_phone_no ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: legal_indicator {
    type: string
    sql: ${TABLE}.legal_indicator ;;
  }

  dimension: login_name {
    type: string
    sql: ${TABLE}.login_name ;;
  }

  dimension: middle_initial {
    type: string
    sql: ${TABLE}.middle_initial ;;
  }

  dimension_group: mobile_download {
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
    sql: ${TABLE}.mobile_download_date ;;
  }

  dimension: mothers_maiden_name {
    type: string
    sql: ${TABLE}.mothers_maiden_name ;;
  }

  dimension: office_phone_no {
    type: string
    sql: ${TABLE}.office_phone_no ;;
  }

  dimension: other_products_balance {
    type: string
    sql: ${TABLE}.other_products_balance ;;
  }

  dimension: past_due_balance {
    type: string
    sql: ${TABLE}.past_due_balance ;;
  }

  dimension_group: past_due {
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
    sql: ${TABLE}.past_due_date ;;
  }

  dimension: promotional_materials {
    type: string
    sql: ${TABLE}.promotional_materials ;;
  }

  dimension: received_tutorial_ind {
    type: string
    sql: ${TABLE}.received_tutorial_ind ;;
  }

  dimension: referred_by {
    type: string
    sql: ${TABLE}.referred_by ;;
  }

  dimension: sex {
    type: string
    sql: ${TABLE}.sex ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: subscription_balance {
    type: string
    sql: ${TABLE}.subscription_balance ;;
  }

  dimension: suffix {
    type: string
    sql: ${TABLE}.suffix ;;
  }

  dimension_group: timelastsessionbegan {
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
    sql: ${TABLE}.timelastsessionbegan ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: transition_balance {
    type: string
    sql: ${TABLE}.transition_balance ;;
  }

  dimension_group: updated_acct_info {
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
    sql: ${TABLE}.updated_acct_info_date ;;
  }

  dimension: uppercase_email {
    type: string
    sql: ${TABLE}.uppercase_email ;;
  }

  dimension: uppercase_first_name {
    type: string
    sql: ${TABLE}.uppercase_first_name ;;
  }

  dimension: uppercase_last_name {
    type: string
    sql: ${TABLE}.uppercase_last_name ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  dimension_group: zip_code_valid {
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
    sql: ${TABLE}.zip_code_valid_date ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      uppercase_first_name,
      uppercase_last_name,
      mothers_maiden_name,
      cc_name,
      login_name,
      last_name,
      first_name
    ]
  }
}
