view: drf_5_card_10_card_classic_harness_formulator {
  derived_table: {
    sql: SELECT
        TO_CHAR(DATE_TRUNC('month', sales.submit_date ), 'YYYY-MM') AS "sales.submit_month",
        product.subchild  AS "product.subchild",
        COALESCE(SUM(sales.quantity ), 0) AS "sales.quantity",
        COALESCE(SUM(sales.sales ), 0) AS "sales.sales"
      FROM looker_scratch.LR$2QALJJ4RVDIMEJFWPKWKB_customer AS customer
      LEFT JOIN looker_scratch.LR$2QMC0GUSIU0JIYNT0SL6D_sales AS sales ON customer.blc_customer_id = sales.customer_id
      LEFT JOIN looker_scratch.LR$2QZF1DEY1LXTPY1WOQZND_product AS product ON product.sku_id = sales.sku_id

      WHERE ((((sales.submit_date ) >= (TIMESTAMP '2018-01-01') AND (sales.submit_date ) < (TIMESTAMP '2019-01-01')))) AND (product.subchild LIKE '%5-Card%' OR product.subchild LIKE '%10-Card%') AND (product.child LIKE '%DRF Classic%' OR product.child LIKE '%DRF Formulator%' OR (product.child LIKE '%Harness%' AND product.subchild LIKE '%DRF Plus%'))
      GROUP BY DATE_TRUNC('month', sales.submit_date ),2
      ORDER BY 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: sales_submit_month {
    type: string
    sql: ${TABLE}."sales.submit_month" ;;
  }

  measure: sales_quantity {
    type: number
    sql: ${TABLE}."sales.quantity" ;;
  }

  measure: sales_sales {
    type: number
    sql: ${TABLE}."sales.sales" ;;
  }

  set: detail {
    fields: [sales_submit_month]
  }
}
