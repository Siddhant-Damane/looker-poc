view: blc_order_view {
  sql_table_name: public.blc_order ;;

  dimension: acknowledged {
    label: "is order acknowledged"
    type: number
    sql: ${TABLE}.acknowledged ;;
  }

  dimension: cancellation_reason_type {
    label: "reason for cacellation"
    type: string
    sql: ${TABLE}.cancellation_reason_type ;;
  }

  dimension: change_order_status {
#     label: ""
    type: string
    sql: ${TABLE}.change_order_status ;;
  }

  dimension: created_by {
  # label: ""
    type: number
    sql: ${TABLE}.created_by ;;
  }

  dimension: csr_order_details_id {
  # label: ""
    type: number
    sql: ${TABLE}.csr_order_details_id ;;
  }

  dimension: csr_tax_details_id {
  # label: ""
    type: number
    sql: ${TABLE}.csr_tax_details_id ;;
  }

  dimension: currency_code {
    label: "currency code"
    type: string
    sql: ${TABLE}.currency_code ;;
  }

  dimension: customer_id {
    label: "customer id"
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: date_created {
    # label: ""
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
    # label: ""
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

  dimension: email_address {
    label: "Email Address"
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: external_id {
    # label: ""
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: is_preview {
    # label: ""
    type: number
    sql: ${TABLE}.is_preview ;;
  }

  dimension: is_secondary {
    # label: ""
    type: number
    sql: ${TABLE}.is_secondary ;;
  }

  dimension: locale_code {
    # label: ""
    type: string
    sql: ${TABLE}.locale_code ;;
  }

  dimension: name {
    # label: ""
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order_admin_assignment_id {
    # label: ""
    type: number
    sql: ${TABLE}.order_admin_assignment_id ;;
  }

  dimension: order_id {
    label: "Order ID"
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_number {
    label: "Order Number"
    type: string
    sql: ${TABLE}.order_number ;;
  }

  dimension: order_status {
    label: "Order Status"
    type: string
    sql: ${TABLE}.order_status ;;
  }

  dimension: order_subtotal {
    # label: ""
    type: number
    sql: ${TABLE}.order_subtotal ;;
  }

  dimension: order_total {
    label: "Order Total"
    type: number
    sql: ${TABLE}.order_total ;;
  }

  dimension: orig_order_number {
    # label: ""
    type: string
    sql: ${TABLE}.orig_order_number ;;
  }

  dimension: parent_order_id {
    # label: ""
    type: number
    sql: ${TABLE}.parent_order_id ;;
  }

  dimension: pricelist_id {
    # label: ""
    type: number
    sql: ${TABLE}.pricelist_id ;;
  }

  dimension: sndbx_archived_flag {
    # label: ""
    type: string
    sql: ${TABLE}.sndbx_archived_flag ;;
  }

  dimension: sndbx_id {
    # label: ""
    type: number
    sql: ${TABLE}.sndbx_id ;;
  }

  dimension_group: submit {
    # label: ""
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
    sql: ${TABLE}.submit_date ;;
  }

  dimension: tax_override {
    # label: ""
    type: number
    sql: ${TABLE}.tax_override ;;
  }

  dimension: total_shipping {
    label: "Shipping total Amount"
    type: number
    sql: ${TABLE}.total_shipping ;;
  }

  dimension: total_tax {
    label: "Total Tax Amount"
    type: number
    sql: ${TABLE}.total_tax ;;
  }

  dimension: updated_by {
    # label: ""
    type: number
    sql: ${TABLE}.updated_by ;;
  }

  measure: count {
    # label: ""
    type: count
    drill_fields: [name]
  }
}
