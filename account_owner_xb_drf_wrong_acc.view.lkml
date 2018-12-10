view: account_owner_xb_drf_wrong_acc {
  sql_table_name: public.account_owner_xb_drf_wrong_acc ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: acct_chg {
    type: string
    sql: ${TABLE}.acct_chg ;;
  }

  dimension: acctowner {
    type: string
    sql: ${TABLE}.acctowner ;;
  }

#   dimension: chg_date {
#     type: string
#     sql: ${TABLE}.chg_date ;;
#   }


#   dimension: chg_date {
#     type: date
#     sql: case
#         when ${TABLE}.chg_date = 'Chg_Date' then '1800-01-01'
#         else ${TABLE}.chg_date
#         end ;;
#   }

  dimension_group: chg_date_formatted {
    type: time
    convert_tz: no
    timeframes: [date, week, month, year]
    sql:case
        when ${TABLE}.chg_date = 'Chg_Date' then '1800-01-01'
        else ${TABLE}.chg_date
        end ;;
  }

  dimension: correct_owner {
    type: string
    sql: ${TABLE}.correct_owner ;;
  }

  dimension: derby {
    type: string
    sql: ${TABLE}.derby ;;
  }

#  dimension: eventdate {
#   type: date
#   convert_tz: no
#   sql: case
#         when ${TABLE}.eventdate = 'EventDate' then '1800-01-01'
#         else ${TABLE}.eventdate
#         end;;
# }

  dimension_group: eventdate_formatted {
    type: time
    timeframes: [date, week, month, year]
    convert_tz: no
    sql:  case
        when ${TABLE}.eventdate = 'EventDate' then '1800-01-01'
        else ${TABLE}.eventdate
        end;;
  }
#
#   measure: handle {
#     type: string
#     sql: ${TABLE}.handle ;;
#   }

  dimension: intf {
    type: string
    sql: ${TABLE}.intf ;;
  }

  dimension: intf_simple {
    type: string
    sql: ${TABLE}.intf_simple ;;
  }

  dimension: owner_simple {
    type: string
    sql: ${TABLE}.owner_simple ;;
  }

  dimension: switch {
    type: string
    sql: ${TABLE}.switch ;;
  }

  dimension: switch_days {
    type:  number
    sql: ${TABLE}.switch_days ;;
  }

#   measure: takeout {
#     type: string
#     sql: ${TABLE}.takeout ;;
#   }

  dimension: handle {
    type: number
    sql: CAST(${TABLE}.handle AS FLOAT) ;;
    value_format: "000.00000000"
  }

  measure: sum_handle {
    type:  sum
    sql: ${handle} ;;
    value_format: "000.00000000"
  }


  dimension: takeout {
    type: number
    sql: CAST(${TABLE}.takeout AS FLOAT) ;;
    value_format: "000.00000000"
  }

  measure: sum_takeout {
    type:  sum
    sql: ${takeout} ;;
    value_format: "000.00000000"
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
