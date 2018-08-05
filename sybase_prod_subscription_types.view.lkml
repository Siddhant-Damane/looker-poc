view: sybase_prod_subscription_types {
  sql_table_name: public.sybase_prod_subscription_types ;;

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: drf_plus_indicator {
    type: string
    sql: ${TABLE}.drf_plus_indicator ;;
  }

  dimension: drf_plus_type {
    type: string
    sql: ${TABLE}.drf_plus_type ;;
  }

  dimension: expiration_date_type {
    type: string
    sql: ${TABLE}.expiration_date_type ;;
  }

  dimension: expiration_date_value {
    type: string
    sql: ${TABLE}.expiration_date_value ;;
  }

  dimension: number_of_tracks {
    type: number
    sql: ${TABLE}.number_of_tracks ;;
  }

  dimension: one_click_eligible_ind {
    type: string
    sql: ${TABLE}.one_click_eligible_ind ;;
  }

  dimension: plan_level {
    type: string
    sql: ${TABLE}.plan_level ;;
  }

  dimension: plan_type {
    type: string
    sql: ${TABLE}.plan_type ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: priority_order {
    type: number
    sql: ${TABLE}.priority_order ;;
  }

  dimension: propick_indicator {
    type: string
    sql: ${TABLE}.propick_indicator ;;
  }

  dimension: renewable_indicator {
    type: string
    sql: ${TABLE}.renewable_indicator ;;
  }

  dimension: subscription_begin_date {
    type: string
    sql: ${TABLE}.subscription_begin_date ;;
  }

  dimension: subscription_enable {
    type: string
    sql: ${TABLE}.subscription_enable ;;
  }

  dimension: subscription_type {
    type: string
    sql: ${TABLE}.subscription_type ;;
  }

  dimension: subscription_type_id {
    type: number
    sql: ${TABLE}.subscription_type_id ;;
  }

  dimension: trial_plan_indicator {
    type: string
    sql: ${TABLE}.trial_plan_indicator ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
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
