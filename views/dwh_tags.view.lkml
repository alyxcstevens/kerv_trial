view: dwh_tags {
  sql_table_name: public.dwh_tags ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: object_id {
    hidden: yes
    type: string
    sql: ${TABLE}.object_id ;;
  }

  measure: count_of_tags {
    type: count
  }
}
