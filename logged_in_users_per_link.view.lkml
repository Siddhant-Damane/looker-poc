view: logged_in_users_per_link {
  derived_table: {
    sql: select count(distinct prod_stream_table.drf_user_id) as "users", max(prod_stream_table.created_at_ms) as "created_at_ms", tt.split_url from  prod_stream_table, (select distinct
      case when split_part(location_url, '/', 4) IN ('top-headlines','race-entries','race-results','classic-pp') and (split_part(location_url, '/', 3) || '/' || split_part(location_url, '/', 4)) IN ('www.drf.com/top-headlines','www.drf.com/race-entries','www.drf.com/race-results','www.drf.com/classic-pp') then (split_part(location_url, '/', 3) || '/' || split_part(location_url, '/', 4))
      when split_part(location_url, '/', 3) IN ('www.drf.com','bets.drf.com','shop.drf.com','sports.drf.com') then split_part(location_url, '/', 3)
      end as "split_url" from prod_stream_table
      where location_url is not null) as tt where tt.split_url is not null and prod_stream_table.drf_user_id is not null and (split_part(location_url, '/', 3) || '/' || split_part(location_url, '/', 4) = tt.split_url) or  (split_part(location_url, '/', 3) = tt.split_url)
      group by 3
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  measure: count_users{
    type: sum
    sql: ${users} ;;
  }
  dimension: split_url {
    type: string
    sql: ${TABLE}.split_url ;;
  }

  set: detail {
    fields: [users, split_url]
  }
  dimension: created_at_ms {
    type: number
    convert_tz: no
    sql: ${TABLE}.created_at_ms ;;
  }

  dimension_group: created_at_ms_formatted {
    type: time
    convert_tz: no
    datatype: epoch
    timeframes: [time, raw, date, week, month, year, hour_of_day]
    sql: CAST(${created_at_ms} AS BIGINT) / 1000;;
  }
}
