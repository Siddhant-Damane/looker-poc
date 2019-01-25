view: count_of_tracks_per_user {
#   filter:created_time_filter {
#     suggest_dimension: created_at_ms
#     type: number
#   }

  derived_table: {
    sql:
     ((SELECT count_of_tracks_per_user.drf_user_id, trim(regexp_substr(trim(count_of_tracks_per_user.location_url, regexp_substr(count_of_tracks_per_user.location_url,'https://www.drf.com/pp-details/[0-9]*-[0-9]*-[0-9]*')),'[A-Z]*')) AS "track_id",
      DATE(CONVERT_TIMEZONE('UTC', 'America/New_York', (timestamp 'epoch' + CAST(count_of_tracks_per_user.created_at_ms AS BIGINT) / 1000 * interval '1 second')))
      FROM public.prod_stream_table  AS count_of_tracks_per_user WHERE (count_of_tracks_per_user.location_url LIKE '%https://www.drf.com/pp-details%')
      AND (count_of_tracks_per_user.drf_user_id IS NOT NULL))
      union
      (select public.prod_stream_table.drf_user_id, json_extract_path_text(json_extract_array_element_text(public.prod_stream_table.meta_data,(json_array_length(public.prod_stream_table.meta_data)-1)),'value'),
       DATE(CONVERT_TIMEZONE('UTC', 'America/New_York', (timestamp 'epoch' + CAST(public.prod_stream_table.created_at_ms AS BIGINT) / 1000 * interval '1 second'))) FROM public.prod_stream_table
      where public.prod_stream_table.event_type = 'CLICK_ON_PP_VIEW' and  json_extract_path_text(json_extract_array_element_text(public.prod_stream_table.meta_data,(json_array_length(public.prod_stream_table.meta_data)-1)),'key') = 'trackId'
      and public.prod_stream_table.drf_user_id IS NOT NULL))
      ;;
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

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: drf_user_id {
    type: string
    sql: ${TABLE}.drf_user_id ;;
  }


  measure: distinct_user_id {
    type: count_distinct
    sql:${TABLE}.drf_user_id ;;
  }

  dimension: track_id {
    type: string
  }

  measure: count_track_id {
    type: count_distinct
    sql: ${track_id} ;;
  }

  dimension: date {
    type: date
    convert_tz:no
  }

  dimension: week {
    convert_tz: no
    sql: TO_CHAR(DATE_TRUNC('week', ${date}), 'YYYY-MM-DD');;
  }

  set: detail {
    fields: [drf_user_id,track_id]
  }
}
