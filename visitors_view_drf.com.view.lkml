view: visitors_to_drf_com {
  derived_table: {
    sql:
      select r.user_tracking_id,r.location_url,r1.drf_user_id, r.source,r.date1 from
      (select registration_view.location_url,registration_view.user_tracking_id,registration_view.source,registration_view.created_at_ms  as "date1" from public.prod_stream_table  as "registration_view"
      WHERE (registration_view.location_url LIKE '%https://promos.drf.com/offer%')  AND (registration_view.source = 'utm_source=DRF')
      AND ((((CAST(registration_view.created_at_ms AS BIGINT) / 1000) >= (DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', TIMESTAMP '2019-01-24'))::bigint) AND (CAST(registration_view.created_at_ms AS BIGINT) / 1000) < (DATE_PART(epoch, CONVERT_TIMEZONE('America/New_York', 'UTC', TIMESTAMP '2019-01-28'))::bigint))))  group by 2,1,3,4
      LIMIT 500) as r, (select public.prod_stream_table.drf_user_id, public.prod_stream_table.user_tracking_id from public.prod_stream_table where public.prod_stream_table.drf_user_id is not Null and public.prod_stream_table.user_tracking_id is not null) as r1
      where r.user_tracking_id = r1.user_tracking_id

      group by 3,1,2,5,4
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_tracking_id {
    type: string
    sql: ${TABLE}.user_tracking_id ;;
  }

  dimension: location_url {
    type: string
    sql: ${TABLE}.location_url ;;
  }

  dimension: drf_user_id {
    type: number
    sql: ${TABLE}.drf_user_id ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: date1 {
    type: number
    convert_tz: no
    sql: ${TABLE}.date1 ;;
  }

  dimension_group: created_at_ms_formatted {
    type: time
    datatype: epoch
    timeframes: [time, raw, date, week, month, year, hour_of_day]
    sql: CAST(${date1} AS BIGINT) / 1000;;
  }


  set: detail {
    fields: [user_tracking_id, location_url, drf_user_id, source, date1]
  }
}
