view: account_signups {
  sql_table_name: public.account_signups ;;

  dimension: account_number {
    type: number
    sql: ${TABLE}.account_number ;;
  }

  dimension: address1 {
    type: string
    sql: ${TABLE}.address1 ;;
  }

  dimension: alternatephone {
    type: string
    sql: ${TABLE}.alternatephone ;;
  }

  dimension_group: birthdate {
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
    sql: ${TABLE}.birthdate ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: datejoined {
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
    sql: ${TABLE}.datejoined ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
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

  dimension: maddress {
    type: string
    sql: ${TABLE}.maddress ;;
  }

  dimension: mcity {
    type: string
    sql: ${TABLE}.mcity ;;
  }

  dimension: mcountry {
    type: string
    sql: ${TABLE}.mcountry ;;
  }

  dimension: mstate {
    type: string
    sql: ${TABLE}.mstate ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: promo_code {
    type: string
    sql: ${TABLE}.promo_code ;;
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

  dimension: sign_up_status {
    type: string
    sql: ${TABLE}.sign_up_status ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: suffix {
    type: string
    sql: ${TABLE}.suffix ;;
  }

  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.zip_code ;;
  }

  measure: count {
    type: count
    drill_fields: [last_name, first_name]
  }
}
