view: percentage_wrt_visitors_ount_login {

    derived_table: {
      sql: select Dtable.first_date,D1table.distinct_drf_customer_id_cond_total, Dtable.distinct_drf_customer_id_total
            from (SELECT
        TO_CHAR(DATE_TRUNC('week', CONVERT_TIMEZONE('UTC', 'America/New_York', (timestamp 'epoch' + CAST(play_user_count.created_at_ms AS BIGINT) / 1000 * interval '1 second'))), 'YYYY-MM-DD')
        as "first_date",
          COUNT(DISTINCT play_user_count.drf_user_id ) AS "distinct_drf_customer_id_total"
        FROM public.prod_stream_table  AS play_user_count
        WHERE  (play_user_count.location_url LIKE 'https://www.drf.com/pp-details%') AND (play_user_count.event_type is not Null) AND (play_user_count.drf_user_id IS NOT NULL)  and
        ((((CAST(play_user_count.created_at_ms AS BIGINT) / 1000) >= ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(week,-7, DATE_TRUNC('week', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) )))::bigint))
        AND (CAST(play_user_count.created_at_ms AS BIGINT) / 1000) < ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(week,7, DATEADD(week,-7, DATE_TRUNC('week', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) ) )))::bigint)))))
        group by 1 ) as Dtable,
        (SELECT TO_CHAR(DATE_TRUNC('week', CONVERT_TIMEZONE('UTC', 'America/New_York', (timestamp 'epoch' + CAST(play_user_count.created_at_ms AS BIGINT) / 1000 * interval '1 second'))), 'YYYY-MM-DD')  as "second_date",
          COUNT(DISTINCT play_user_count.drf_user_id ) AS "distinct_drf_customer_id_cond_total"
        FROM public.prod_stream_table  AS play_user_count
        WHERE (play_user_count.event_type = 'CLICK_ON_BET_NOW') AND (play_user_count.drf_user_id IS NOT NULL)  and
        ((((CAST(play_user_count.created_at_ms AS BIGINT) / 1000) >= ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(week,-7, DATE_TRUNC('week', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) )))::bigint))
        AND (CAST(play_user_count.created_at_ms AS BIGINT) / 1000) < ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(week,7, DATEADD(week,-7, DATE_TRUNC('week', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) ) )))::bigint)))))
        group by 1 ) as D1table
        where Dtable.first_date = D1table.second_date;;

      }

      dimension: distinct_drf_customer_id_cond_total {
        type: number
        sql: ${TABLE}.distinct_drf_customer_id_cond_total ;;
      }

      measure: distinct_drf_customer_id_cond_total_measure {
        type: sum
        sql: ${TABLE}.distinct_drf_customer_id_cond_total ;;
      }

      dimension: distinct_drf_customer_id_total {
        type: number
        sql: ${TABLE}.distinct_drf_customer_id_total ;;
      }

      measure: distinct_drf_customer_id_total_measure{
        type: sum
        sql: ${TABLE}.distinct_drf_customer_id_total ;;
      }

      dimension: first_date {
        type: string
        convert_tz: no
        sql: ${TABLE}.first_date ;;
      }

      measure: percentage  {
        type: number
#     value_format: "2"
        sql: 100.0 * ${distinct_drf_customer_id_cond_total_measure} / ${distinct_drf_customer_id_total_measure};;
      }

#   dimension: second_date {
#     type: date
#     convert_tz: no
#     sql: ${TABLE}.second_date ;;
#   }

      # dimension_group: created_at_ms_formatted {
      #   type: time
      #   datatype: epoch
      #   convert_tz: no
      #   timeframes: [time, raw, date, week, month, year, hour_of_day]
      #   sql: CAST(${created_at_ms} AS BIGINT) / 1000;;
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

# view: percentage_wrt_total_visitors_count {
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
