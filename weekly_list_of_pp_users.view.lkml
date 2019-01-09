view: weekly_list_of_pp_users {

    derived_table: {
      sql:
           select ss.drf_user_id,
              DATE(CONVERT_TIMEZONE('UTC', 'America/New_York', (timestamp 'epoch' + CAST(ss.created_at_ms AS BIGINT) / 1000 * interval '1 second'))) AS "date",
              max(CASE WHEN ((((CAST(ss.created_at_ms AS BIGINT) / 1000) >= ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(week,-2, DATE_TRUNC('week', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) )))::bigint))
                          AND (CAST(ss.created_at_ms AS BIGINT) / 1000) < ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(week,1, DATEADD(week,-2, DATE_TRUNC('week', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) ) )))::bigint)))))THEN 1 ELSE 0 END) as priorSecondWeek,

              max(CASE WHEN ((((CAST(ss.created_at_ms AS BIGINT) / 1000) >= ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(week,-1, DATE_TRUNC('week', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) )))::bigint)) AND
     (CAST(ss.created_at_ms AS BIGINT) / 1000) < ((DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', DATEADD(week,1, DATEADD(week,-1, DATE_TRUNC('week', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/New_York', GETDATE()))) ) )))::bigint)))))THEN 1 ELSE 0 END) as priorFirstWeek

      FROM public.prod_stream_table as ss where ss.drf_user_id IS NOT NULL and ss.location_url like 'https://www.drf.com/pp-details%' group by 1,2



              --) and  s1.location_url LIKE '%https://play.drf.com/%' group by 1) --as s2 group by s2.min
               ;;
    }

#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }

    dimension: drf_user_id {
      type: string
      sql: ${TABLE}.drf_user_id ;;
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
      convert_tz: no
      timeframes: [time, raw, date, week, month, year, hour_of_day]
      sql: CAST(${created_at_ms} AS BIGINT) / 1000;;
    }

#   dimension: min_non_beta_user_date {
#     type: date
#     convert_tz: no
#
#   }
#   set: detail {
#     fields: [drf_user_id, ]
#   }

    measure: two_weeks_ago {
      group_label: "Prior Week Measures"
      type: sum
      sql: ${TABLE}.priorSecondWeek ;;
    }
    measure: one_week_ago {
      group_label: "Prior Week Measures"
      type: sum
      sql: ${TABLE}.priorFirstWeek ;;
    }


    dimension: per_day {
      description: "When the event happened"
      type: date_day_of_week
#     type: date
      convert_tz: no
      sql:${TABLE}.date;;

    }

  }
