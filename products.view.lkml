view: products {
  sql_table_name: demo_db.products ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    label: "Item name"
    description: "It's just the item name!"                                         ## adding tooltip
    type: string
    sql: ${TABLE}.item_name ;;
    html:
     <p style="color: red; font-size: 13px; font-family:courier">{{ value }}</p>;;  ## adding HTML
    link: {                                                                         ## adding ... to data- uses liquid to bring in the data-point {{variable (value)}}
      label: "Google"
      url: "http://www.google.com/search?q={{ value }}"
      icon_url: "http://google.com/favicon.ico"
    }
    link: {
      label: "Bing"
      url: "http://www.bing.com/search?q={{ value }}"
      icon_url: "http://bing.com/favicon.ico"
    }
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
  measure: Average_retail_price{
    type: average
    sql: ${TABLE}.retail_price ;;
    value_format: "$#.00;($#.00)"
    drill_fields: [id, item_name, inventory_items.count, retail_price]
  }

}
