view: site_wide_visitors_feb {

    derived_table: {
      sql: select
                ss.user_tracking_id,--DATE(CONVERT_TIMEZONE('UTC', 'America/New_York', (timestamp 'epoch' + CAST(ss.created_at_ms AS BIGINT) / 1000 * interval '1 second'))) AS "date",
               max(CASE WHEN ((((CAST(ss.created_at_ms AS BIGINT) / 1000) >= ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(month,-2, DATE_TRUNC('month', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) )))::bigint))
                          AND (CAST(ss.created_at_ms AS BIGINT) / 1000) < ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(month,1, DATEADD(month,-2, DATE_TRUNC('month', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) ) )))::bigint)))))THEN 1 ELSE 0 END) as priorSecondMonth,

                max(CASE WHEN ((((CAST(ss.created_at_ms AS BIGINT) / 1000) >= ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(month,-1, DATE_TRUNC('month', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) )))::bigint)) AND
     (CAST(ss.created_at_ms AS BIGINT) / 1000) < ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(month,1, DATEADD(month,-1, DATE_TRUNC('month', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) ) )))::bigint)))))THEN 1 ELSE 0 END) as priorFirstMonth
                  from public.prod_stream_table as ss where ss.user_tracking_id is Not Null
--                  and
--                  ((((CAST(ss.created_at_ms AS BIGINT) / 1000) >= ((DATE_PART(epoch, DATEADD(week,-2, DATE_TRUNC('week', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) ))::bigint)) AND (CAST(ss.created_at_ms AS BIGINT) / 1000) < ((DATE_PART(epoch, DATEADD(week,2, DATEADD(week,-2, DATE_TRUNC('week', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) ) ))::bigint)))))

                  group by 1;;


    }

    dimension: drf_user_id {
      type: string
      sql: ${TABLE}.drf_user_id ;;
    }

#   dimension: location_url {
#     type: string
#     sql: ${TABLE}.location_url ;;
#   }

#     dimension: per_day {
#       description: "When the event happened"
#       type: date_day_of_week
# #         type: date
#       convert_tz: no
#       sql:${TABLE}.date;;
#
#     }

#   dimension_group: created_at_date {
#     type: time
#     datatype: epoch
#     timeframes: [time, raw, date, week, month, year, hour_of_day,day_of_week]
#     sql: CAST(to_timestamp(${TABLE}.date,'DD-MM-YYYY')  AS BIGINT) / 1000;;
#   }

    dimension: created_at {
      description: "When the event happened"
      type: string
      sql: ${TABLE}.created_at ;;
    }

    dimension: created_at_ms {
      type: number
      sql: ${TABLE}.created_at_ms ;;
    }

#     dimension_group: created_at_ms_formatted {
#       type: time
#       datatype: epoch
#       convert_tz: no
#       timeframes: [time, raw, date, week, month, year, hour_of_day]
#       sql: CAST(${created_at_ms} AS BIGINT) / 1000;;
#     }

    measure: two_month_ago {
      group_label: "Prior Week Measures"
      type: sum
      sql: ${TABLE}.priorSecondMonth ;;
    }
    measure: one_month_ago {
      group_label: "Prior Week Measures"
      type: sum
      sql: ${TABLE}.priorFirstMonth ;;
    }



    # # You can specify the table name if it's different from the view name:
    # sql_table_name: my_schema_name.tester ;;
    #
    # # Define your dimensions and measures here, like this:
    # dimension: user_id {
    #   description: "Unique ID for each user that has ordered"
    #   type: number
    #   sql: ${TABLE}.user_id ;;
    # }
    #
    # dimension: lifetime_orders {
    #   description: "The total number of orders for each user"
    #   type: number
    #   sql: ${TABLE}.lifetime_orders ;;
    # }
    #
    # dimension_group: most_recent_purchase {
    #   description: "The date when each user last ordered"
    #   type: time
    #   timeframes: [date, week, month, year]
    #   sql: ${TABLE}.most_recent_purchase_at ;;
    # }
    #
    # measure: total_lifetime_orders {
    #   description: "Use this for counting lifetime orders across many users"
    #   type: sum
    #   sql: ${lifetime_orders} ;;
    # }

# view: active_users_per_day_weekly_comparison {
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

    # # You can specify the table name if it's different from the view name:
    # sql_table_name: my_schema_name.tester ;;
    #
    # # Define your dimensions and measures here, like this:
    # dimension: user_id {
    #   description: "Unique ID for each user that has ordered"
    #   type: number
    #   sql: ${TABLE}.user_id ;;
    # }
    #
    # dimension: lifetime_orders {
    #   description: "The total number of orders for each user"
    #   type: number
    #   sql: ${TABLE}.lifetime_orders ;;
    # }
    #
    # dimension_group: most_recent_purchase {
    #   description: "The date when each user last ordered"
    #   type: time
    #   timeframes: [date, week, month, year]
    #   sql: ${TABLE}.most_recent_purchase_at ;;
    # }
    #
    # measure: total_lifetime_orders {
    #   description: "Use this for counting lifetime orders across many users"
    #   type: sum
    #   sql: ${lifetime_orders} ;;
    # }
    # }

# view: active_bets_users_weekly_comparison {
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

    # # You can specify the table name if it's different from the view name:
    # sql_table_name: my_schema_name.tester ;;
    #
    # # Define your dimensions and measures here, like this:
    # dimension: user_id {
    #   description: "Unique ID for each user that has ordered"
    #   type: number
    #   sql: ${TABLE}.user_id ;;
    # }
    #
    # dimension: lifetime_orders {
    #   description: "The total number of orders for each user"
    #   type: number
    #   sql: ${TABLE}.lifetime_orders ;;
    # }
    #
    # dimension_group: most_recent_purchase {
    #   description: "The date when each user last ordered"
    #   type: time
    #   timeframes: [date, week, month, year]
    #   sql: ${TABLE}.most_recent_purchase_at ;;
    # }
    #
    # measure: total_lifetime_orders {
    #   description: "Use this for counting lifetime orders across many users"
    #   type: sum
    #   sql: ${lifetime_orders} ;;
    # }


# view: site_wide_visitors_weekly_comparison {
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

  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: site_wide_visitors_feb {
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
