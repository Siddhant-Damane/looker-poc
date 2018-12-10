view: account_owner_xb_drf {
  sql_table_name: public.account_owner_xb_drf ;;

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
    sql: ${TABLE}.acct_chg;;
  }

  dimension: acctowner {
    type: string
    sql: ${TABLE}.acctowner ;;
  }

#   dimension: chg_date {
#     type: date
#     sql: case
#         when ${TABLE}.chg_date = 'Chg_Date' then to_date(${TABLE}.chg_date, '1800-01-01')
#         else to_date(${TABLE}.chg_date, 'yyyy-mm-dd')
#         end ;;
#   }
  dimension_group: chg_date_formatted {
    type: time
    convert_tz: no
    timeframes: [date, week, month, year]
    sql: case
        when ${TABLE}.chg_date = 'Chg_Date' then to_date(${TABLE}.chg_date, '1800-01-01')
        else to_date(${TABLE}.chg_date, 'yyyy-mm-dd')
        end ;;
  }

#
#   dimension_group: chg_date{
#     type: time
#     datatype: yyyymmdd
#     sql: ${TABLE}.chg_date;;
#   }
  dimension: correct_owner {
    type: string
    sql: ${TABLE}.correct_owner ;;
  }

  dimension: derby {
    type: string
    sql: ${TABLE}.derby ;;
  }



#   dimension: eventdate {
#     type: date
#     sql: to_date(${TABLE}.eventdate, 'yyyy-mm-dd') ;;
#   }
#
#   dimension_group: eventdate{
#     type: time
#     datatype: yyyymmdd
#     sql: ${eventdate};;
#   }

#   dimension: eventdate {
#     type: date
#     convert_tz: no
#     sql: case
#         when ${TABLE}.eventdate = 'EventDate' then to_date(${TABLE}.eventdate, '1800-01-01')
#         else to_date(${TABLE}.eventdate, 'yyyy-mm-dd')
#         end;;
#   }

  dimension_group: eventdate_formatted {
    type: time
    convert_tz: no
    timeframes: [date, week, month, year]
    sql: case
        when ${TABLE}.eventdate = 'EventDate' then to_date(${TABLE}.eventdate, '1800-01-01')
        else to_date(${TABLE}.eventdate, 'yyyy-mm-dd')
        end;;
  }


  dimension: handle {
    type: number
    sql: cast(${TABLE}.handle as decimal);;
  }


  measure: sum_hnadle {
    type:  sum
    sql: ${handle} ;;
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
    type: number
    sql: ${TABLE}.switch_days ;;
  }



  measure: count {
    type: count
    drill_fields: [id]
  }
}
