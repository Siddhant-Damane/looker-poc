view: blc_order_item_attribute {
  sql_table_name: public.blc_order_item_attribute ;;

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order_item_attribute_id {
    type: number
    sql: ${TABLE}.order_item_attribute_id ;;
  }

  dimension: order_item_id {
    type: number
    sql: ${TABLE}.order_item_id ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
