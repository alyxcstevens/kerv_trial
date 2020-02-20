view: dwh_lineitems {
  sql_table_name: public.dwh_lineitems ;;

  dimension: pk {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${id},${src}) ;;
  }

  dimension: id {
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.end_date ;;
  }

  dimension: impression_budget {
    type: number
    sql: ${TABLE}.impression_budget ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: rate {
    type: number
    sql: ${TABLE}.rate ;;
  }

  dimension: src {
    hidden: yes
    type: string
    sql: ${TABLE}.src ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_date ;;
  }

  measure: count_of_line_items {
    type: count
  }
}
