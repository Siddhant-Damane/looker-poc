view: blc_order_item_view {
  sql_table_name: public.blc_order_item ;;

  dimension: category_id {
    #label: ""
    type: number
    sql: ${TABLE}.category_id ;;
  }

  dimension: created_by {
    #label: ""
    type: number
    sql: ${TABLE}.created_by ;;
  }

  dimension: csr_details_id {

    #label: ""
    type: number
    sql: ${TABLE}.csr_details_id ;;
  }

  dimension_group: date_created {
    #label: ""
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
    #label: ""
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

  dimension: discounts_allowed {
    #label: ""
    type: number
    sql: ${TABLE}.discounts_allowed ;;
  }

  dimension: gift_wrap_item_id {
    #label: ""
    type: number
    sql: ${TABLE}.gift_wrap_item_id ;;
  }

  dimension: has_validation_errors {
    #label: ""
    type: number
    sql: ${TABLE}.has_validation_errors ;;
  }

  dimension: item_taxable_flag {
    #label: ""
    type: number
    sql: ${TABLE}.item_taxable_flag ;;
  }

  dimension: name {
    #label: ""
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order_id {
    #label: ""
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_item_id {
    #label: ""
    type: number
    sql: ${TABLE}.order_item_id ;;
  }

  dimension: order_item_type {
    #label: ""
    type: string
    sql: ${TABLE}.order_item_type ;;
  }

  dimension: parent_order_item_id {
    #label: ""
    type: number
    sql: ${TABLE}.parent_order_item_id ;;
  }

  dimension: personal_message_id {
    #label: ""
    type: number
    sql: ${TABLE}.personal_message_id ;;
  }

  dimension: price {
    #label: ""
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: quantity {
    #label: ""
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: retail_price {
    #label: ""
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: retail_price_data_id {
    #label: ""
    type: number
    sql: ${TABLE}.retail_price_data_id ;;
  }

  dimension: retail_price_list_id {
    #label: ""
    type: number
    sql: ${TABLE}.retail_price_list_id ;;
  }

  dimension: retail_price_override {
    #label: ""
    type: number
    sql: ${TABLE}.retail_price_override ;;
  }

  dimension: sale_price {
    #label: ""
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension: sale_price_data_id {
    #label: ""
    type: number
    sql: ${TABLE}.sale_price_data_id ;;
  }

  dimension: sale_price_list_id {
    #label: ""
    type: number
    sql: ${TABLE}.sale_price_list_id ;;
  }

  dimension: sale_price_override {
    #label: ""
    type: number
    sql: ${TABLE}.sale_price_override ;;
  }

  dimension: total_tax {
    #label: ""
    type: number
    sql: ${TABLE}.total_tax ;;
  }

  dimension: updated_by {
    #label: ""
    type: number
    sql: ${TABLE}.updated_by ;;
  }

  measure: count {
    #label: ""
    type: count
    drill_fields: [name]
  }
}
