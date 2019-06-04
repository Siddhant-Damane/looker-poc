view: cards_per_customer_for_single_card_classic {
  derived_table: {
    sql: -- raw sql results do not include filled-in values for 'sales.submit_month_name'


      -- use existing sales in looker_scratch.LR$2Q2EBWKR7JVJGCNA68X1D_sales
      -- use existing customer in looker_scratch.LR$2QDMYH1PKB1A0VN3HSHQ_customer
      -- use existing product in looker_scratch.LR$2QDU13X8JVQ74JAF46EC_product

      select
        this.submit_month_name as "Month",
        count(distinct this.drf_customer_id) as "No. of Customers" ,
        this.quantity as "No. of Cards"
      from (
      SELECT
        TO_CHAR(sales.submit_date , 'FMMonth') AS "submit_month_name",
        customer.drf_customer_id  AS "drf_customer_id",
        COALESCE(SUM(sales.quantity ), 0) AS "quantity"
      FROM looker_scratch.LR$2QDMYH1PKB1A0VN3HSHQ_customer AS customer
      LEFT JOIN looker_scratch.LR$2Q2EBWKR7JVJGCNA68X1D_sales AS sales ON customer.blc_customer_id = sales.customer_id
      LEFT JOIN looker_scratch.LR$2QDU13X8JVQ74JAF46EC_product AS product ON product.sku_id = sales.sku_id

      WHERE ((((sales.submit_date ) >= ((TIMESTAMP '2018-01-01')) AND (sales.submit_date ) < ((DATEADD(year,1, TIMESTAMP '2018-01-01' )))))) AND ((product.subchild LIKE '%Single%') AND (product.subchild NOT LIKE '%Deluxe%' OR product.subchild IS NULL)) AND (product.child = 'DRF Classic')
      GROUP BY 1,2
      ORDER BY 2
      ) AS this

      group by 1,3
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }
  dimension_group: submit {
    type: time
    timeframes: [day_of_week,date, week, month, month_name,year, week_of_year]
    sql: ${TABLE}.submit_date ;;
    }
  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: no__of_customers {
    type: number
    label: "no. of customers"
    sql: ${TABLE}."no. of customers" ;;
  }

  measure: no__of_cards {
    type: number
    label: "no. of cards"
    sql: ${TABLE}."no. of cards" ;;
  }

  set: detail {
    fields: [month, no__of_customers]
  }
}
