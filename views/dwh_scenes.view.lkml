view: dwh_scenes {
  sql_table_name: public.dwh_scenes ;;

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

  dimension: start_frame {
    type: number
    sql: ${TABLE}.start_frame ;;
  }

  dimension: stop_frame {
    type: number
    sql: ${TABLE}.stop_frame ;;
  }

  measure: count_of_scenes {
    type: count
  }
}
