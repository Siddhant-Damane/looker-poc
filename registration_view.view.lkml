view: registration_view {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: public.prod_stream_table ;;
  #
  # # Define your dimensions and measures here, like this:
  dimension: event_type {
     description: "type of user event"
     type: string
     sql: ${TABLE}.event_type ;;
   }

  dimension: location_url {
    description: "location_url"
    type: string
    sql: ${TABLE}.location_url ;;
  }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  dimension: created_at {
    description: "When the event happened"
    type: string
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_at_ms {
    type: number
    sql: ${TABLE}.created_at_ms ;;
  }

  dimension_group: created_at_ms_formatted {
    type: time
    datatype: epoch
    timeframes: [time, raw, date, week, month, year, hour_of_day]
    sql: CAST(${created_at_ms} AS BIGINT) / 1000;;
  }

  measure: event_count {
    description: "count of user event"
    type: count
    sql: ${event_type} ;;
    drill_fields: []
  }

  measure: distinct_event_count {
    description: "count of user event"
    type: count_distinct
    sql: ${event_type} ;;
    drill_fields: []
  }

  dimension: meta_data {
    description: "App specific event meta data"
    type: string
    sql: ${TABLE}.meta_data ;;
  }

  dimension: form_field {
    description: "field clicked"
    type: string
    sql: json_extract_path_text(json_extract_array_element_text(${TABLE}.meta_data, 0, true), 'value', true) ;;
  }

}

# view: prod_stream_table {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
