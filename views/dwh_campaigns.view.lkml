view: dwh_campaigns {
  sql_table_name: public.dwh_campaigns ;;

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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: src {
    hidden: yes
    type: string
    sql: ${TABLE}.src ;;
  }

  measure: count_of_campaigns {
    type: count
  }
}
