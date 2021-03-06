view: dwh_geo_summary {
  label: "Geo Summary"
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
    hidden: yes
    type: string
    sql: ${TABLE}.eventtype ;;
  }

  dimension: event_type {
    type: string
    case: {
      when: {
        sql: ${eventtype} = 2 ;;
        label: "Object Link"
      }
      when: {
        sql: ${eventtype} IN (3,8) ;;
        label: "Frame Select"
      }
      when: {
        sql: ${eventtype} = 4 ;;
        label: "Scene Save"
      }
      when: {
        sql: ${eventtype} = 5 ;;
        label: "Impression"
      }
      when: {
        sql: ${eventtype} = 10 ;;
        label: "Quartile 25%"
      }
      when: {
        sql: ${eventtype} = 11 ;;
        label: "Quartile 50%"
      }
      when: {
        sql: ${eventtype} = 12 ;;
        label: "Quartile 75%"
      }
      when: {
        sql: ${eventtype} = 13 ;;
        label: "Quartile 100%"
      }
      when: {
        sql: ${eventtype} = 16 ;;
        label: "Primary CTA"
      }
      when: {
        sql: ${eventtype} = 17 ;;
        label: "Brand Logo Click"
      }
      when: {
        sql: ${eventtype} = 18 ;;
        label: "Kerv Logo Click"
      }
      when: {
        sql: ${eventtype} = 19 ;;
        label: "Auto Populate Scene"
      }
      when: {
        sql: ${eventtype} = 21 ;;
        label: "Carousel Scroll"
      }
      when: {
        sql: ${eventtype} = 23;;
        label: "Object Highlight"
      }
      when: {
        sql: ${eventtype} = 24 ;;
        label: "Background Click"
      }
      when: {
        sql: ${eventtype} = 25 ;;
        label: "Scene Close"
      }
      when: {
        sql: ${eventtype} = 27 ;;
        label: "Carousel Open"
      }
      when: {
        sql: ${eventtype} = 28 ;;
        label: "Carousel Close"
      }
      when: {
        sql: ${eventtype} = 31;;
        label: "Swipe"
      }
      when: {
        sql: ${eventtype} = 32 ;;
        label: "Share"
      }
      when: {
        sql: ${eventtype} = 33 ;;
        label: "Object Highlight Exit"
      }
    }
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

  dimension: media_type_name {
    type: number
    sql: CASE WHEN ${TABLE}.mediatype = 1 THEN 'Video' ELSE 'Banner' END ;;
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
    sql: ${TABLE}.usermobile;;
  }

  dimension: user_mobile_name {
    type: string
    sql: CASE WHEN ${usermobile} = 1 then 'Mobile'
    ELSE 'Desktop' END;;
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
    drill_fields: [advertiserid, campaignid]
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
    group_label: "Quartiles"
  }
  measure: quartile_50 {
    description: "When the ad playback reaches 50% completion"
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "11"
    }
    group_label: "Quartiles"
  }
  measure: quartile_75 {
    description: "When the ad playback reaches 75% completion"
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "12"
    }
    group_label: "Quartiles"
  }
  measure: quartile_100 {
    description: "When the ad playback reaches 100% completion"
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "13"
    }
    group_label: "Quartiles"
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

## Need to select the correct interactions and activities below

  measure: interactions {
    type: number
    sql: ${frame_select} + ${object_link} + ${object_highlight} + ${primary_cta}
          + ${brand_logo_click} + ${share};;
    group_label: "Interactions"
  }

  measure: banner_interactions {
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "2,23,24"
    }
    filters: {
      field: mediatype
      value: "2"
    }
    group_label: "Interactions"
  }

  measure: video_interactions {
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "2,3,4,8,16,17,23,32"
    }
    filters: {
      field: mediatype
      value: "1"
    }
    group_label: "Interactions"
  }

measure: activities {
  type: number
  sql: ${frame_select} + ${scene_save} + ${object_highlight} +${object_link} + ${primary_cta}
          + ${brand_logo_click} + ${carousel_open} + ${carousel_close} + ${carousel_scroll}
          + ${share} + ${swipe};;
  group_label: "Activities"
}

measure: video_activites {
  type: sum
  sql: ${ct} ;;
  filters: {
    field: eventtype
    value: "2,3,4,8,16,17,21,23,27,28,31"
  }
filters: {
  field: mediatype
  value: "1"
}
  group_label: "Activities"
}

  measure: banner_clicks {
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "2,24"
    }
    filters: {
      field: mediatype
      value: "2"
    }
    group_label: "Clicks"
  }

  measure: video_clicks {
    type: sum
    sql: ${ct} ;;
    filters: {
      field: eventtype
      value: "2,16,17"
    }
    filters: {
      field: mediatype
      value: "1"
    }
    group_label: "Clicks"
  }


## RATE CALCULATIONS =================================

  measure: interaction_rate {
    type: number
    sql: 1.0 * ${interactions} / NULLIF(${impression},0)  ;;
    value_format_name: percent_2
    group_label: "Rates"
  }

  measure: activity_rate {
    type: number
    sql: 1.0 * ${activities} / NULLIF(${impression},0) ;;
    value_format_name: percent_2
    group_label: "Rates"
  }

  measure: scene_save_rate {
    type: number
    sql: 1.0 * ${scene_save} / NULLIF(${impression},0)  ;;
    value_format_name: percent_2
    group_label: "Rates"
  }

  measure: frame_select_rate {
    type: number
    sql: 1.0 * ${frame_select} / NULLIF(${impression},0) ;;
    value_format_name: percent_2
    group_label: "Rates"
  }

  measure: object_highlight_rate {
    type: number
    sql: 1.0 * ${object_highlight} / NULLIF(${frame_select},0) ;;
    value_format_name: percent_2
    group_label: "Rates"
  }

  measure: object_link_rate {
    type: number
    sql: 1.0*${object_link} / NULLIF(${impression},0) ;;
    value_format_name: percent_2
    group_label: "Rates"
  }

  measure: pcta_click_rate {
    type: number
    sql: 1.0 * ${primary_cta} / NULLIF(${impression},0)  ;;
    value_format_name: percent_2
    group_label: "Rates"
  }
  measure: completion_rate {
    type: number
    sql: 1.0 * ${quartile_100} / NULLIF(${impression},0)  ;;
    value_format_name: percent_2
    group_label: "Rates"
  }
  measure: OH_to_OL_ratio {
    type: number
    sql: 1.0 * ${object_link} / NULLIF(${object_highlight},0) ;;
    value_format_name: percent_2
  }

  measure: banner_interactions_rate {
    type: number
    sql: 1.0 * ${banner_interactions} / NULLIF(${impression},0)  ;;
    value_format_name: percent_2
    group_label: "Rates"
  }

  measure: video_interactions_rate {
    type: number
    sql: 1.0 * ${video_interactions} / NULLIF(${impression},0)  ;;
    value_format_name: percent_2
    group_label: "Rates"
  }

  measure: video_activities_rate {
    type: number
    sql: 1.0 * ${video_activites} / NULLIF(${impression},0)  ;;
    value_format_name: percent_2
    group_label: "Rates"
  }

  measure: banner_clicks_rate {
    type: number
    sql: 1.0 * ${banner_clicks} / NULLIF(${impression},0)  ;;
    value_format_name: percent_2
    group_label: "Rates"
  }

  measure: video_clicks_rate {
    type: number
    sql: 1.0 * ${video_clicks} / NULLIF(${impression},0) ;;
    value_format_name: percent_2
    group_label: "Rates"
  }

drill_fields: [event_date, campaignid, targeted_segments, impression]

  }
