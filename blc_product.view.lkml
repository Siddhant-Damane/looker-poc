view: blc_product {
  sql_table_name: public.blc_product ;;

  dimension: admin_addition_status {
    type: string
    sql: ${TABLE}.admin_addition_status ;;
  }

  dimension: archived {
    type: string
    sql: ${TABLE}.archived ;;
  }

  dimension: can_sell_without_options {
    type: number
    sql: ${TABLE}.can_sell_without_options ;;
  }

  dimension: created_by {
    type: number
    sql: ${TABLE}.created_by ;;
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

  dimension: default_category_id {
    type: number
    sql: ${TABLE}.default_category_id ;;
  }

  dimension: default_sku_id {
    type: number
    sql: ${TABLE}.default_sku_id ;;
  }

  dimension: display_template {
    type: string
    sql: ${TABLE}.display_template ;;
  }

  dimension: enterprise_uuid {
    type: string
    sql: ${TABLE}.enterprise_uuid ;;
  }

  dimension: has_child_add_ons {
    type: number
    sql: ${TABLE}.has_child_add_ons ;;
  }

  dimension: is_featured_product {
    type: number
    sql: ${TABLE}.is_featured_product ;;
  }

  dimension: manufacture {
    type: string
    sql: ${TABLE}.manufacture ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: override_generated_url {
    type: number
    sql: ${TABLE}.override_generated_url ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}.product_type ;;
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

  dimension: theme_file_id {
    type: number
    sql: ${TABLE}.theme_file_id ;;
  }

  dimension: updated_by {
    type: number
    sql: ${TABLE}.updated_by ;;
  }

  dimension: upgrade_family_type {
    type: string
    sql: ${TABLE}.upgrade_family_type ;;
  }

  dimension: upgradeable {
    type: number
    sql: ${TABLE}.upgradeable ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: url_key {
    type: string
    sql: ${TABLE}.url_key ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
