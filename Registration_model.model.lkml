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
