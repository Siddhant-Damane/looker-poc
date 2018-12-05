view: drf_customer {
  sql_table_name: public.drf_customer ;;

  dimension: created_by {
    type: number
    sql: ${TABLE}.created_by ;;
  }

  dimension: broadleaf_customer_id {
    label: "Broadleaf Customer ID"
    type: string
    sql: ${TABLE}.customer_id ;;
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

  dimension: DRF_Customer_ID {
    label: "DRF Customer ID"
    type: string
    sql: ${TABLE}.legacy_id ;;
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
