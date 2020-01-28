view: dwh_ssp_summary {
  sql_table_name: public.dwh_ssp_summary ;;

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

  dimension: deal_id {
    type: string
    sql: ${TABLE}.deal_id ;;
  }

  dimension: distributionid {
    type: string
    sql: ${TABLE}.distributionid ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: eventtype {
    type: string
    sql: ${TABLE}.eventtype ;;
  }

  dimension: hour {
    type: number
    sql: ${TABLE}.hour ;;
  }

  dimension: inventory_source {
    type: string
    sql: ${TABLE}.inventory_source ;;
  }

  dimension: lineitemid {
    type: string
    sql: ${TABLE}.lineitemid ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
