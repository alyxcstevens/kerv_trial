view: dwh_objects {
  sql_table_name: public.dwh_objects ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: asset_list_index {
    type: number
    sql: ${TABLE}.asset_list_index ;;
  }

  dimension: creative_id {
    type: string
    sql: ${TABLE}.creative_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: scene_id {
    type: string
    sql: ${TABLE}.scene_id ;;
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
