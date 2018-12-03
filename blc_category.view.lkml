view: blc_category {
  sql_table_name: public.blc_category ;;

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

  dimension: admin_addition_status {
    type: string
    sql: ${TABLE}.admin_addition_status ;;
  }

  dimension: archived {
    type: string
    sql: ${TABLE}.archived ;;
  }

  dimension: category_id {
    type: number
    sql: ${TABLE}.category_id ;;
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

  dimension: default_parent_category_id {
    type: number
    sql: ${TABLE}.default_parent_category_id ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
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

  dimension: inventory_type {
    type: string
    sql: ${TABLE}.inventory_type ;;
  }

  dimension: long_description {
    type: string
    sql: ${TABLE}.long_description ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: override_generated_url {
    type: number
    sql: ${TABLE}.override_generated_url ;;
  }

  dimension: root_display_order {
    type: number
    sql: ${TABLE}.root_display_order ;;
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

  dimension: theme_file_id {
    type: number
    sql: ${TABLE}.theme_file_id ;;
  }

  dimension: updated_by {
    type: number
    sql: ${TABLE}.updated_by ;;
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
    drill_fields: [name]
  }
}
