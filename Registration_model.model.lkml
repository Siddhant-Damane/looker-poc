connection: "drf_event_stream_production"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
explore: registration_view {}
explore: blc_order_view {}
explore: blc_order_item_view {}
explore: wager_view {}
explore: resolved_bet_view {}
explore: user_funnel_view {}
#Paly Dashboard Views
explore: play_user_count {
#   sql_always_where: ${DRF_Customer_ID} is not Null;;
}
explore: count_of_play_user_by_device {
  sql_always_where: ${DRF_Customer_ID} is not Null;;
}
explore: famous_drf_play_clicked_url {
  sql_always_where: ${DRF_Customer_ID} is not Null;;
}
explore: average_number_of_clicks_by_user {
  sql_always_where: ${DRF_Customer_ID} is not Null;;
}
explore: play_event_count_by_user {
  sql_always_where: ${DRF_Customer_ID} is not Null;;
}
explore: count_of_tracks_per_user {
  sql_always_where: ${drf_user_id} is not Null;;
}
explore: single_page_view_users {
  sql_always_where: ${drf_user_id} is not Null;;
}
explore: total_count_of_users_with_single_page_view {}
# explore: count_of_users_with_tracks {}
explore: user_count_with_no_track_data {
  sql_always_where: ${drf_user_id} is not Null;;
}
explore: count_events_per_day {
  sql_always_where: ${DRF_Customer_ID} is not Null;;
}
explore: active_users_per_day {
  sql_always_where: ${DRF_Customer_ID} is not Null;;
}
explore: user_signup_through_offer_page {
  sql_always_where: ${DRF_Customer_ID} is not Null;;
}
explore: user_signup_through_fb_page {
  sql_always_where: ${DRF_Customer_ID} is not Null;;
}
explore: user_signup_through_join_page {
  sql_always_where: ${DRF_Customer_ID} is not Null;;
}
explore: users_not_beta_users {
  sql_always_where: ${drf_user_id} is not Null;;
}
explore: list_of_non_beta_users {
  sql_always_where: ${drf_user_id} is not Null;;
}
explore: user_count {
#   sql_always_where: ${DRF_Customer_ID} is not Null;;
}

# Bets Dashboard Views
# explore: bets_user_count {
#   sql_always_where: ${DRF_Customer_ID} is not Null;;
# }
explore: next_events_list {}

explore: active_users_weekly_comparison {}
explore: weekly_list_of_non_beta_users {}
