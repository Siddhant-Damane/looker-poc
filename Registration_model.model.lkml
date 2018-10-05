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
explore: user_funnel_view {}
explore: play_user_count {}
explore: count_of_play_user_by_device {}
explore: famous_drf_play_clicked_url {}
explore: average_number_of_clicks_by_user {}
explore: play_event_count_by_user {}
explore: count_of_tracks_per_user {}
explore: single_page_view_users {}
explore: total_count_of_users_with_single_page_view {}
# explore: count_of_users_with_tracks {}
explore: user_count_with_no_track_data {}
explore: count_events_per_day {}
explore: active_users_per_day {}
explore: user_signup_through_offer_page {}
explore: user_signup_through_fb_page {}
explore: user_signup_through_join_page {}
explore: users_not_beta_users {}
explore: list_of_non_beta_users {}
explore: non_beta_users_dummy {}
