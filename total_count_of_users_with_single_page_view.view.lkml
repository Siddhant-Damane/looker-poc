view: total_count_of_users_with_single_page_view {
  derived_table: {
    sql: -- select distinct(ss.drf_user_id), ss.location_url,ss.event_type as total_drf_play_event
      --       from public.prod_stream_table ss
      --       where ss.drf_user_id is not Null and ss.location_url like 'https://play.drf.com/%'
      --       group by 1,2,3
      --       having COUNT(1) = ()

            select count(*) as user_count from (select count(public.prod_stream_table.drf_user_id) as user_id from public.prod_stream_table
            where public.prod_stream_table.location_url like 'https://play.drf.com/%' and public.prod_stream_table.drf_user_id is not Null
            group by  public.prod_stream_table.drf_user_id
            having count(public.prod_stream_table.location_url) = 1) as total_row_count
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_count {
    type: number
    sql: ${TABLE}.user_count ;;
  }

  set: detail {
    fields: [user_count]
  }
}
