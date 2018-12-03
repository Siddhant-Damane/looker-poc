view: blc_sku {
  sql_table_name: public.blc_sku ;;

  dimension_group: active_end {
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
    sql: ${TABLE}.active_end_date ;;
  }

  dimension_group: active_start {
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
    sql: ${TABLE}.active_start_date ;;
  }

  dimension: addl_product_id {
    type: number
    sql: ${TABLE}.addl_product_id ;;
  }

  dimension: admin_addition_status {
    type: string
    sql: ${TABLE}.admin_addition_status ;;
  }

  dimension: archived {
    type: string
    sql: ${TABLE}.archived ;;
  }

  dimension: available_flag {
    type: string
    sql: ${TABLE}.available_flag ;;
  }

  dimension: billing_frequency_type {
    type: string
    sql: ${TABLE}.billing_frequency_type ;;
  }

  dimension: container_shape {
    type: string
    sql: ${TABLE}.container_shape ;;
  }

  dimension: container_size {
    type: string
    sql: ${TABLE}.container_size ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: created_by {
    type: number
    sql: ${TABLE}.created_by ;;
  }

  dimension: currency_code {
    type: string
    sql: ${TABLE}.currency_code ;;
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

  dimension: default_product_id {
    type: number
    sql: ${TABLE}.default_product_id ;;
  }

  dimension: depth {
    type: number
    sql: ${TABLE}.depth ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: dimension_unit_of_measure {
    type: string
    sql: ${TABLE}.dimension_unit_of_measure ;;
  }

  dimension: discountable_flag {
    type: string
    sql: ${TABLE}.discountable_flag ;;
  }

  dimension: display_order {
    type: number
    sql: ${TABLE}.display_order ;;
  }

  dimension: display_template {
    type: string
    sql: ${TABLE}.display_template ;;
  }

  dimension: enterprise_uuid {
    type: string
    sql: ${TABLE}.enterprise_uuid ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: fulfillment_type {
    type: string
    sql: ${TABLE}.fulfillment_type ;;
  }

  dimension: girth {
    type: number
    sql: ${TABLE}.girth ;;
  }

  dimension: height {
    type: number
    sql: ${TABLE}.height ;;
  }

  dimension: inventory_type {
    type: string
    sql: ${TABLE}.inventory_type ;;
  }

  dimension: is_machine_sortable {
    type: number
    sql: ${TABLE}.is_machine_sortable ;;
  }

  dimension: is_subscription {
    type: number
    sql: ${TABLE}.is_subscription ;;
  }

  dimension: is_trial {
    type: number
    sql: ${TABLE}.is_trial ;;
  }

  dimension: long_description {
    type: string
    sql: ${TABLE}.long_description ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: paid_subscription_sku_id {
    type: number
    sql: ${TABLE}.paid_subscription_sku_id ;;
  }

  dimension: quantity_available {
    type: number
    sql: ${TABLE}.quantity_available ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension: sku_id {
    type: number
    sql: ${TABLE}.sku_id ;;
  }

  dimension: sndbx_archived_flag {
    type: string
    sql: ${TABLE}.sndbx_archived_flag ;;
  }

  dimension: sndbx_catalog_flag {
    type: number
    sql: ${TABLE}.sndbx_catalog_flag ;;
  }

  dimension: sndbx_deleted_flag {
    type: string
    sql: ${TABLE}.sndbx_deleted_flag ;;
  }

  dimension: sndbx_id {
    type: number
    sql: ${TABLE}.sndbx_id ;;
  }

  dimension: sndbx_orig_item_id {
    type: number
    sql: ${TABLE}.sndbx_orig_item_id ;;
  }

  dimension: sndbx_orig_record_id {
    type: number
    sql: ${TABLE}.sndbx_orig_record_id ;;
  }

  dimension: sndbx_tier {
    type: number
    sql: ${TABLE}.sndbx_tier ;;
  }

  dimension: sndbx_tmplt_record_id {
    type: number
    sql: ${TABLE}.sndbx_tmplt_record_id ;;
  }

  dimension: tax_code {
    type: string
    sql: ${TABLE}.tax_code ;;
  }

  dimension: taxable_flag {
    type: string
    sql: ${TABLE}.taxable_flag ;;
  }

  dimension: trial_period_days {
    type: number
    sql: ${TABLE}.trial_period_days ;;
  }

  dimension: upc {
    type: string
    sql: ${TABLE}.upc ;;
  }

  dimension: updated_by {
    type: number
    sql: ${TABLE}.updated_by ;;
  }

  dimension: upgrade_level {
    type: number
    sql: ${TABLE}.upgrade_level ;;
  }

  dimension: url_key {
    type: string
    sql: ${TABLE}.url_key ;;
  }

  dimension: weight {
    type: number
    sql: ${TABLE}.weight ;;
  }

  dimension: weight_unit_of_measure {
    type: string
    sql: ${TABLE}.weight_unit_of_measure ;;
  }

  dimension: width {
    type: number
    sql: ${TABLE}.width ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
