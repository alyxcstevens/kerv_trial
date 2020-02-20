view: dwh_creatives {
  sql_table_name: public.dwh_creatives ;;

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

  measure: count_of_creatives {
    type: count
  }
}
