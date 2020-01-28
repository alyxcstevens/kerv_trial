view: dwh_scenes {
  sql_table_name: public.dwh_scenes ;;
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

  dimension: start_frame {
    type: number
    sql: ${TABLE}.start_frame ;;
  }

  dimension: stop_frame {
    type: number
    sql: ${TABLE}.stop_frame ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
