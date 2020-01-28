view: dwh_lineitems {
  sql_table_name: public.dwh_lineitems ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: end_date {
    type: string
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
    type: string
    sql: ${TABLE}.src ;;
  }

  dimension: start_date {
    type: string
    sql: ${TABLE}.start_date ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
