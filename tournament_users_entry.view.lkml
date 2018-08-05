view: tournament_users_entry {
  sql_table_name: public.tournament_users_entry ;;

  dimension_group: creation {
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
    sql: ${TABLE}.creation_time ;;
  }

  dimension: eliminated_round_number {
    type: number
    sql: ${TABLE}.eliminated_round_number ;;
  }

  dimension: entry_fees {
    type: number
    sql: ${TABLE}.entry_fees ;;
  }

  dimension: entry_id {
    type: number
    sql: ${TABLE}.entry_id ;;
  }

  dimension: entry_no {
    type: number
    sql: ${TABLE}.entry_no ;;
  }

  dimension: is_awarded {
    type: number
    sql: ${TABLE}.is_awarded ;;
  }

  dimension: is_eliminated {
    type: number
    sql: ${TABLE}.is_eliminated ;;
  }

  dimension: is_free {
    type: number
    sql: ${TABLE}.is_free ;;
  }

  dimension: is_invite {
    type: number
    sql: ${TABLE}.is_invite ;;
  }

  dimension: tournament_id {
    type: number
    sql: ${TABLE}.tournament_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
