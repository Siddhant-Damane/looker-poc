view: drf_formulator_profile {
  sql_table_name: public.drf_formulator_profile ;;

  dimension: beyerspeed_graph_open_all {
    type: string
    sql: ${TABLE}.beyerspeed_graph_open_all ;;
  }

  dimension: card_open {
    type: string
    sql: ${TABLE}.card_open ;;
  }

  dimension: chart_option {
    type: string
    sql: ${TABLE}.chart_option ;;
  }

  dimension: check_all_ind {
    type: string
    sql: ${TABLE}.check_all_ind ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: ex_beyer_data_ind {
    type: string
    sql: ${TABLE}.ex_beyer_data_ind ;;
  }

  dimension: ex_closer_look_data_ind {
    type: string
    sql: ${TABLE}.ex_closer_look_data_ind ;;
  }

  dimension: ex_extension {
    type: string
    sql: ${TABLE}.ex_extension ;;
  }

  dimension: ex_format {
    type: string
    sql: ${TABLE}.ex_format ;;
  }

  dimension: ex_header_ind {
    type: string
    sql: ${TABLE}.ex_header_ind ;;
  }

  dimension: ex_horse_data_ind {
    type: string
    sql: ${TABLE}.ex_horse_data_ind ;;
  }

  dimension: ex_race_data_ind {
    type: string
    sql: ${TABLE}.ex_race_data_ind ;;
  }

  dimension: ex_running_line_data_ind {
    type: string
    sql: ${TABLE}.ex_running_line_data_ind ;;
  }

  dimension: ex_setting {
    type: string
    sql: ${TABLE}.ex_setting ;;
  }

  dimension: ex_track_fact_combo_data_ind {
    type: string
    sql: ${TABLE}.ex_track_fact_combo_data_ind ;;
  }

  dimension: ex_track_fact_jocky_data_ind {
    type: string
    sql: ${TABLE}.ex_track_fact_jocky_data_ind ;;
  }

  dimension: ex_track_fact_trainer_data_ind {
    type: string
    sql: ${TABLE}.ex_track_fact_trainer_data_ind ;;
  }

  dimension: ex_trainer_data_ind {
    type: string
    sql: ${TABLE}.ex_trainer_data_ind ;;
  }

  dimension: ex_update_data_ind {
    type: string
    sql: ${TABLE}.ex_update_data_ind ;;
  }

  dimension: ex_workout_data_ind {
    type: string
    sql: ${TABLE}.ex_workout_data_ind ;;
  }

  dimension: font_sharpness {
    type: number
    sql: ${TABLE}.font_sharpness ;;
  }

  dimension: font_thickness {
    type: number
    sql: ${TABLE}.font_thickness ;;
  }

  dimension: landscape_print_ind {
    type: string
    sql: ${TABLE}.landscape_print_ind ;;
  }

  dimension: live_video_speed_type {
    type: string
    sql: ${TABLE}.live_video_speed_type ;;
  }

  dimension: maximum_pp_lines {
    type: number
    sql: ${TABLE}.maximum_pp_lines ;;
  }

  dimension: print_pp_track_diagram_ind {
    type: string
    sql: ${TABLE}.print_pp_track_diagram_ind ;;
  }

  dimension: race_conditions_option {
    type: string
    sql: ${TABLE}.race_conditions_option ;;
  }

  dimension: tm_base_bet {
    type: number
    sql: ${TABLE}.tm_base_bet ;;
  }

  dimension: tm_budget_amount {
    type: number
    sql: ${TABLE}.tm_budget_amount ;;
  }

  dimension: tm_wager_type {
    type: string
    sql: ${TABLE}.tm_wager_type ;;
  }

  dimension: use_applied_pp_profile_ind {
    type: string
    sql: ${TABLE}.use_applied_pp_profile_ind ;;
  }

  dimension: zoom {
    type: number
    sql: ${TABLE}.zoom ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
