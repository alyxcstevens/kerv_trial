view: dwh_advertisers {
  sql_table_name: public.dwh_advertisers ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: agency_id {
    type: string
    sql: ${TABLE}.agency_id ;;
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
