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

  dimension: state {
    type:  string
    sql: RIGHT(${geo_region}, 2) ;;
  }

  dimension: map_region {
    type: string
    map_layer_name: us_states
    sql: ${state} ;;
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

  ## New Content Added Co-Dev #2

  measure: object_link {
    description: "When a user clicks on a hotspot"
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "2"
    }
  }
  measure: frame_select {
    description: "When a user launches a scene from the carousel"
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "3"
    }
  }
  measure: scene_save {
    description: "When a user clicks on the video and saves a scene"
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "4"
    }
  }
  measure: impression {
    description: "When the ad is loaded and starts playback"
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "5"
    }
  }
  measure: frame_select_pre_select {
    description: "When a user launches a scene from the carousel that was previously selected"
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "8"
    }
  }
  measure: quartile_25 {
    description: "When the ad playback reaches 25% completion"
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "10"
    }
  }
  measure: quartile_50 {
    description: "When the ad playback reaches 50% completion"
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "11"
    }
  }
  measure: quartile_75 {
    description: "When the ad playback reaches 75% completion"
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "12"
    }
  }
  measure: quartile_100 {
    description: "When the ad playback reaches 100% completion"
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "13"
    }
  }
  measure: primary_cta {
    description: "The user clicks on the PCTA button"
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "16"
    }
  }
  measure: brand_logo_click {
    description: "The user clicks on the Brand Logo"
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "17"
    }
  }
  measure: kerv_logo_click {
    description: "The user clicks on the “Powered by KERV” watermark"
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "18"
    }
  }
  measure: auto_populate_scene {
    description: "When a scene is added to the carousel automatically"
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "19"
    }
  }
  measure: carousel_scroll {
    description: "The user scrolls the scenes in the carousel"
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "21"
    }
  }
  measure: object_highlight {
    description: "When the user hovers over a hotspot"
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "23"
    }
  }

  measure: ba {
    type: number
    sql: ${carousel_open} + ${object_highlight} ;;
  }

  measure: scene_close {
    description: "When a scene is closed"
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "25"
    }
  }
  measure: carousel_open {
    description: "When the user clicks the tab to open the carousel"
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "27"
    }
  }
  measure: carousel_close {
    description: "When the user clicks the tab to close the carousel"
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "28"
    }
  }
  measure: swipe {
    description: "When user swipes across the hotspot (mobile)"
    type: sum
    sql: ${ct} ;;
    filters: {
    field: eventtype
    value: "31"
    }
    }
    measure: share {
    description: "When the user clicks on the Share button (mobile)"
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "32"
    }
  }
  measure: object_highlight_exit {
    description: "When the user clicks out of the object"
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "33"
    }
  }



  }
