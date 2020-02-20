view: dwh_objects {
  sql_table_name: public.dwh_objects ;;

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

  dimension: asset_list_index {
    type: number
    sql: ${TABLE}.asset_list_index ;;
  }

  dimension: creative_id {
    hidden: yes
    type: string
    sql: ${TABLE}.creative_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: scene_id {
    hidden: yes
    type: string
    sql: ${TABLE}.scene_id ;;
  }

  dimension: src {
    hidden: yes
    type: string
    sql: ${TABLE}.src ;;
  }

  measure: count_of_objects {
    type: count
  }
}
