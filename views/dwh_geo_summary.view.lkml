view: dwh_geo_summary {
  sql_table_name: public.dwh_geo_summary ;;

  dimension: advertiserid {
    type: string
    sql: ${TABLE}.advertiserid ;;
  }

  dimension: assetlinkurl {
    type: string
    sql: ${TABLE}.assetlinkurl ;;
  }

  dimension: assetlistindex {
    type: number
    sql: ${TABLE}.assetlistindex ;;
  }

  dimension: bid_price_micros_usd {
    type: number
    sql: ${TABLE}.bid_price_micros_usd ;;
  }

  dimension: campaignid {
    type: string
    sql: ${TABLE}.campaignid ;;
  }

  dimension: clearing_price_micros_usd {
    type: number
    sql: ${TABLE}.clearing_price_micros_usd ;;
  }

  dimension: creativeid {
    type: string
    sql: ${TABLE}.creativeid ;;
  }

  dimension: ct {
    type: number
    sql: ${TABLE}.ct ;;
  }

  measure: sum_ct {
    type: sum
    sql: ${ct} ;;
  }

  measure: total_impression {
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "5"
    }
  }

  dimension: day {
    type: string
    sql: ${TABLE}.day ;;
  }

  dimension_group: event {
    type: time
    sql: TO_DATE(${day}, 'YYYY-MM-DD') ;;
    timeframes: [time,date,raw,week,month,quarter,day_of_week]
  }

  dimension: deal_id {
    type: string
    sql: ${TABLE}.deal_id ;;
  }

  dimension: distributionid {
    type: string
    sql: ${TABLE}.distributionid ;;
  }

  dimension: eventtype {
    type: string
    sql: ${TABLE}.eventtype ;;
  }

  dimension: frame {
    type: string
    sql: ${TABLE}.frame ;;
  }

  dimension: geo_city {
    type: string
    sql: ${TABLE}.geo_city ;;
  }

  dimension: geo_region {
    type: string
    sql: ${TABLE}.geo_region ;;
  }

  dimension: hour {
    type: number
    sql: ${TABLE}.hour ;;
  }

  dimension: inventory_source {
    type: string
    sql: ${TABLE}.inventory_source ;;
  }

  dimension: line_item_id {
    type: number
    sql: ${TABLE}.line_item_id ;;
  }

  dimension: line_item_name {
    type: string
    sql: ${TABLE}.line_item_name ;;
  }

  dimension: mediatype {
    type: number
    sql: ${TABLE}.mediatype ;;
  }

  dimension: platform_device_make {
    type: string
    sql: ${TABLE}.platform_device_make ;;
  }

  dimension: platform_device_type {
    type: string
    sql: ${TABLE}.platform_device_type ;;
  }

  dimension: targeted_segments {
    type: string
    sql: ${TABLE}.targeted_segments ;;
  }

  dimension: userbrowser {
    type: string
    sql: ${TABLE}.userbrowser ;;
  }

  dimension: usermobile {
    type: number
    sql: ${TABLE}.usermobile ;;
  }

  dimension: vendor_fee_micros_usd {
    type: number
    sql: ${TABLE}.vendor_fee_micros_usd ;;
  }

  dimension: video_player_size {
    type: string
    sql: ${TABLE}.video_player_size ;;
  }

  dimension: video_start_delay {
    type: number
    sql: ${TABLE}.video_start_delay ;;
  }

  dimension: win_cost_micros_usd {
    type: number
    sql: ${TABLE}.win_cost_micros_usd ;;
  }

  measure: count {
    type: count
    drill_fields: [line_item_name]
  }
}
