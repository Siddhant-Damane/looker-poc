view: blc_discrete_order_item {
  sql_table_name: public.blc_discrete_order_item ;;

  dimension: base_retail_price {
    type: number
    sql: ${TABLE}.base_retail_price ;;
  }

  dimension: base_sale_price {
    type: number
    sql: ${TABLE}.base_sale_price ;;
  }

  dimension: bundle_order_item_id {
    type: number
    sql: ${TABLE}.bundle_order_item_id ;;
  }

  dimension: category_id {
    type: number
    sql: ${TABLE}.category_id ;;
  }

  dimension: order_item_id {
    type: number
    sql: ${TABLE}.order_item_id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: sku_bundle_item_id {
    type: number
    sql: ${TABLE}.sku_bundle_item_id ;;
  }

  dimension: sku_id {
    type: number
    sql: ${TABLE}.sku_id ;;
  }

  dimension: subscription_id {
    type: number
    sql: ${TABLE}.subscription_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
