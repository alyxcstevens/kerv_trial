view: dwh_ds_summary {
  sql_table_name: public.dwh_ds_summary ;;

  dimension: advertiserid {
    type: string
    sql: ${TABLE}.advertiserid ;;
  }

  dimension: campaignid {
    type: string
    sql: ${TABLE}.campaignid ;;
  }

  dimension: creativeid {
    type: string
    sql: ${TABLE}.creativeid ;;
  }

  dimension: ct {
    type: number
    sql: ${TABLE}.ct ;;
  }

  dimension: day {
    type: string
    sql: ${TABLE}.day ;;
  }

  dimension: distributionid {
    type: string
    sql: ${TABLE}.distributionid ;;
  }

  dimension: eventtype {
    type: number
    sql: ${TABLE}.eventtype ;;
  }

  dimension: hour {
    type: string
    sql: ${TABLE}.hour ;;
  }

  dimension: lineitemid {
    type: string
    sql: ${TABLE}.lineitemid ;;
  }

  dimension: unique_users {
    type: number
    sql: ${TABLE}.unique_users ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
