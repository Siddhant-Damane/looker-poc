view: single_page_view_users {
      derived_table: {
        sql: -- select distinct(ss.drf_user_id), ss.location_url,ss.event_type as total_drf_play_event
                --       from public.prod_stream_table ss
                --       where ss.drf_user_id is not Null and ss.location_url like 'https://play.drf.com/%'
                --       group by 1,2,3
                --       having COUNT(1) = ()

                      select public.prod_stream_table.drf_user_id, max(public.prod_stream_table.event_type) as event_type from public.prod_stream_table
                      where public.prod_stream_table.location_url like 'https://play.drf.com/%' and public.prod_stream_table.drf_user_id is not Null
                      group by  1
                      having count(public.prod_stream_table.location_url) = 1
                 ;;
      }

      measure: count {
        type: count
        drill_fields: [detail*]
      }

      dimension: drf_user_id {
        type: number
        sql: ${TABLE}.drf_user_id ;;
      }

      dimension: event_type {
        type: string
        sql: ${TABLE}.event_type ;;
      }

      set: detail {
        fields: [drf_user_id, event_type]
      }

 }
