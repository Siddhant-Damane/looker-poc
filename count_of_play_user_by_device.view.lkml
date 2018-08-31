view: count_of_play_user_by_device {
  derived_table: {
    sql: SELECT CASE
        WHEN ss.device = 'desktop' THEN 'desktop'
        WHEN ss.device = 'console' THEN 'console'
        WHEN ss.device = 'smarttv' THEN 'smarttv'
        WHEN json_extract_path_text(ss.device, 'type') != '' THEN json_extract_path_text(ss.device, 'type')
        ELSE 'Device Unknown'
      END  AS "device_model",

count(DISTINCT(ss.drf_user_id)) as drf_play_user_count
from public.prod_stream_table ss
where ss.location_url like 'https://play.drf.com/%'
group by 1
order by 1
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: device_model {
    type: string
    sql: ${TABLE}."device_model" ;;
  }

  dimension: drf_play_user_count {
    type: number
    sql: ${TABLE}.drf_play_user_count ;;
  }

  set: detail {
    fields: [device_model, drf_play_user_count]
  }
}
