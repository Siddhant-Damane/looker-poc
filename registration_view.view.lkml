view: registration_view {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: public.prod_stream_table ;;
  #
  # # Define your dimensions and measures here, like this:

  dimension: ip_address {
    description: "ip address"
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: application {
    description: "application Name"
    type: string
    sql: ${TABLE}.application ;;
  }
  dimension: logged_in_status {
    description: "Logged In status"
    type: string
    sql: ${TABLE}.logged_in_status ;;
  }
  dimension: operating_system {
    description: "operating system"
    type: string
    sql: ${TABLE}.operating_system ;;
  }

  dimension: browser {
    description: "browser"
    type: string
    sql: ${TABLE}.browser ;;
  }
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

  measure: distict_drf_customer_Id {
    description: "count of User_Tracking_ID"
    type: count_distinct
    sql: ${DRF_Customer_ID} ;;
    drill_fields: []
  }

  measure: distict_user_tracking_Id {
    description: "count of drf_customer_Id"
    type: count_distinct
    sql: ${User_Tracking_ID} ;;
    drill_fields: []
  }

  measure: distinct_xpb_Id {
    description: "count of xpb_Id"
    type: count_distinct
    sql: ${XPB_ID} ;;
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

  dimension: device_type{
    description: "type of device"
    type: string
     sql:CASE
          WHEN ${TABLE}.device = 'desktop'  THEN 'desktop'
          ELSE json_extract_path_text( ${TABLE}.device, 'type', true)
         END ;;
  }

dimension: device_model{
  description: "device model"
  type: string
  sql: CASE
        WHEN ${TABLE}.device = 'desktop' THEN 'desktop'
        WHEN ${TABLE}.device = 'console' THEN 'console'
        WHEN ${TABLE}.device = 'smarttv' THEN 'smarttv'
        WHEN json_extract_path_text(${TABLE}.device, 'vendor') = '' AND json_extract_path_text(${TABLE}.device, 'model') = '' AND json_extract_path_text(${TABLE}.device, 'type') = 'tablet' THEN 'Tablet, Device Unknown'
        WHEN json_extract_path_text(${TABLE}.device, 'type') = 'tablet' AND json_extract_path_text(${TABLE}.device, 'vendor') = 'Apple' THEN 'Apple Tablet'
        WHEN json_extract_path_text(${TABLE}.device, 'type') = 'tablet' AND json_extract_path_text(${TABLE}.device, 'vendor') = 'Microsoft' THEN 'Microsoft Tablet'
        WHEN json_extract_path_text(${TABLE}.device, 'type') = 'tablet' AND json_extract_path_text(${TABLE}.device, 'vendor') != '' THEN 'Android Tablet'
        WHEN json_extract_path_text(${TABLE}.device, 'type') = 'mobile' AND json_extract_path_text(${TABLE}.device, 'vendor') = 'Apple' THEN 'Apple Mobile'
        WHEN json_extract_path_text(${TABLE}.device, 'type') = 'mobile' AND json_extract_path_text(${TABLE}.device, 'vendor') = 'Microsoft' THEN 'Microsoft Mobile'
        WHEN json_extract_path_text(${TABLE}.device, 'type') = 'mobile' AND json_extract_path_text(${TABLE}.device, 'vendor') = 'BlackBerry' THEN 'BlackBerry Mobile'
        WHEN json_extract_path_text(${TABLE}.device, 'vendor') = '' AND json_extract_path_text(${TABLE}.device, 'model') = '' AND json_extract_path_text(${TABLE}.device, 'type') = 'mobile' THEN 'Mobile, Device Unknown'
        ELSE 'Android, Mobile'
      END ;;
      }

dimension: source {
  description: "Source"
  type: string
  sql:  ${TABLE}.source ;;
  }

dimension: DRF_Customer_ID {
  description: "DRF Customer ID"
  type: string
  sql:  ${TABLE}.drf_user_id ;;
}

dimension: User_Tracking_ID {
  description: "User Tracking ID"
  type: string
  sql:  ${TABLE}.user_tracking_id ;;
}

dimension: XPB_ID {
  description: "XPB User ID"
  type: string
  sql:  ${TABLE}.xpb_user_id ;;
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
