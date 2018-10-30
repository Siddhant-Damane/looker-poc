view: play_user_count {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: public.prod_stream_table ;;
  #
  # # Define your dimensions and measures here, like this:


  dimension: location_url {
    description: "location_url"
    type: string
    sql: ${TABLE}.location_url ;;

  }

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

  dimension: DRF_Customer_ID {
    description: "DRF Customer ID"
    type: string
    sql:  ${TABLE}.drf_user_id ;;
  }

  measure: distinct_DRF_Customer_ID {
    description: "count of user event"
    type: count_distinct
    sql: ${DRF_Customer_ID} ;;
    drill_fields: []
  }

  dimension: XPB_ID {
    description: "XPB User ID"
    type: string
    sql:  ${TABLE}.xpb_user_id ;;
  }

  dimension: User_Tracking_ID {
    description: "User Tracking ID"
    type: string
    sql:  ${TABLE}.user_tracking_id ;;
  }

  measure: distinct_User_Tracking_ID {
    description: "count of user tracking id"
    type: count_distinct
    sql: ${User_Tracking_ID} ;;
    drill_fields: []
  }

  measure: distinct_XPB_ID{
    description: "count of user XPB_ID"
    type: count_distinct
    sql: ${XPB_ID} ;;
    drill_fields: []
  }

}

# view: play_user_count {
#   derived_table: {
#     sql: select MIN(ss.created_at) as created_at, ss.drf_user_id from public.prod_stream_table ss where ss.location_url like 'https://play.drf.com/%' and ss.drf_user_id is Not Null group by 2
#        ;;
#   }
#
#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }
#
#   dimension: drf_user_id {
#   type: string
#   sql: ${TABLE}.drf_user_id ;;
#   }
#
#   dimension: created_at {
#     type: string
#     sql: ${TABLE}.created_at ;;
#   }
#
#   set: detail {
#     fields: [drf_user_id,created_at]
#   }
#
# }
