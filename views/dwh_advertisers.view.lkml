view: dwh_advertisers {
  sql_table_name: public.dwh_advertisers ;;

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

  dimension: agency_id {
    hidden: yes
    type: string
    sql: ${TABLE}.agency_id ;;
  }

  dimension: advertiser_name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: src {
    hidden: yes
    type: string
    sql: ${TABLE}.src ;;
  }

  measure: count_of_advertisers {
    type: count
  }
}
