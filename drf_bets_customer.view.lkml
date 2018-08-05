view: drf_bets_customer {
  sql_table_name: public.drf_bets_customer ;;

  dimension: account_balance {
    type: number
    sql: ${TABLE}.account_balance ;;
  }

  dimension: account_status {
    type: string
    sql: ${TABLE}.account_status ;;
  }

  dimension_group: birth {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.birth_date ;;
  }

  dimension: company_code {
    type: string
    sql: ${TABLE}.company_code ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension_group: email_queued_date_1 {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.email_queued_date_1 ;;
  }

  dimension_group: email_queued_date_2 {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.email_queued_date_2 ;;
  }

  dimension_group: email_queued_date_3 {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.email_queued_date_3 ;;
  }

  dimension: external_customer_id {
    type: number
    sql: ${TABLE}.external_customer_id ;;
  }

  dimension: external_customer_sn {
    type: string
    sql: ${TABLE}.external_customer_sn ;;
  }

  dimension_group: last_date_updated {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_date_updated ;;
  }

  dimension: mailing_city {
    type: string
    sql: ${TABLE}.mailing_city ;;
  }

  dimension: mailing_street {
    type: string
    sql: ${TABLE}.mailing_street ;;
  }

  dimension: mailing_zip_code {
    type: string
    sql: ${TABLE}.mailing_zip_code ;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
  }

  dimension: promotional_materials_ind {
    type: string
    sql: ${TABLE}.promotional_materials_ind ;;
  }

  dimension: residential_city {
    type: string
    sql: ${TABLE}.residential_city ;;
  }

  dimension: residential_street {
    type: string
    sql: ${TABLE}.residential_street ;;
  }

  dimension: residential_zip_code {
    type: string
    sql: ${TABLE}.residential_zip_code ;;
  }

  dimension_group: signup {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.signup_date ;;
  }

  dimension: signup_promotion_code {
    type: string
    sql: ${TABLE}.signup_promotion_code ;;
  }

  dimension: signup_status {
    type: string
    sql: ${TABLE}.signup_status ;;
  }

  dimension_group: store_email_queued_date_1 {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.store_email_queued_date_1 ;;
  }

  dimension_group: store_email_queued_date_2 {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.store_email_queued_date_2 ;;
  }

  dimension_group: store_purchase_date_1 {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.store_purchase_date_1 ;;
  }

  dimension_group: store_purchase_date_2 {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.store_purchase_date_2 ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
