view: dwh_creatives {
  sql_table_name: public.dwh_creatives ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: src {
    type: string
    sql: ${TABLE}.src ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
