view: dwh_tags {
  sql_table_name: public.dwh_tags ;;
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

  dimension: object_id {
    type: string
    sql: ${TABLE}.object_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
