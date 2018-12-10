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


  dimension: chg_date {
    type: date
    sql: case
        when ${TABLE}.chg_date = 'Chg_Date' then to_date(${TABLE}.chg_date, '1800-01-01')
        else to_date(${TABLE}.chg_date, 'yyyy-mm-dd')
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

 dimension: eventdate {
  type: date
  sql: case
        when ${TABLE}.eventdate = 'EventDate' then to_date(${TABLE}.eventdate, '1800-01-01')
        else to_date(${TABLE}.eventdate, 'yyyy-mm-dd')
        end;;
}

  measure: handle {
    type: string
    sql: ${TABLE}.handle ;;
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
    type:  number
    sql: ${TABLE}.switch_days ;;
  }

  measure: takeout {
    type: string
    sql: ${TABLE}.takeout ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}