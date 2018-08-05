view: tournament_entry_pick {
  sql_table_name: public.tournament_entry_pick ;;

  dimension: alternate_horse_id {
    type: number
    sql: ${TABLE}.alternate_horse_id ;;
  }

  dimension: entry_id {
    type: number
    sql: ${TABLE}.entry_id ;;
  }

  dimension: horse_id {
    type: number
    sql: ${TABLE}.horse_id ;;
  }

  dimension_group: last_updated {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_updated ;;
  }

  dimension: payout_horse_id {
    type: number
    sql: ${TABLE}.payout_horse_id ;;
  }

  dimension: pick_id {
    type: number
    sql: ${TABLE}.pick_id ;;
  }

  dimension: race_id {
    type: number
    sql: ${TABLE}.race_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
