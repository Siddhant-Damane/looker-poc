view: blc_category_product_xref {
  sql_table_name: public.blc_category_product_xref ;;

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

  dimension: category_product_id {
    type: number
    sql: ${TABLE}.category_product_id ;;
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

  dimension: default_reference {
    type: number
    sql: ${TABLE}.default_reference ;;
  }

  dimension: display_order {
    type: number
    sql: ${TABLE}.display_order ;;
  }

  dimension: enterprise_uuid {
    type: string
    sql: ${TABLE}.enterprise_uuid ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
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

  dimension: updated_by {
    type: number
    sql: ${TABLE}.updated_by ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
