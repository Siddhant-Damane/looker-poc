view: single_page_view_users {
      derived_table: {
        sql:  select public.prod_stream_table.drf_user_id, max(public.prod_stream_table.event_type) as event_type from public.prod_stream_table
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
