view: geo_daily_summary_pdt {


  derived_table: {
    datagroup_trigger: pdt_daily_refresh
#       distribution_style: even
    distribution: "advertiserid"
    sortkeys: ["event_raw"]
    # If necessary, uncomment the line below to include explore_source.
# include: "optimization_kerv.model.lkml"

          explore_source: dwh_geo_summary {
            column: event_raw {}
            column: advertiserid {}
            column: campaignid {}
            column: line_item_name {}
            column: map_region {}
            column: user_mobile_name {}
            column: impression {}
            column: video_clicks {}
            column: video_activites {}
            column: video_interactions {}
            column: scene_save {}
            column: frame_select {}
            column: object_highlight {}
            column: object_link {}
            column: primary_cta {}
            column: brand_logo_click {}
            column: event_type {}
            column: sum_ct {}
            filters: {
              field: dwh_geo_summary.event_date
              value: "6 months"
            }
          }
        }

        #dimensions
        dimension_group: event {
          type: time
          timeframes: [
            raw,
            date,
            week,
            month,
            quarter,
            year
          ]
          sql: ${TABLE}.event_raw ;;
        }
        dimension: advertiserid {
          hidden: yes
        }
        dimension: campaignid {
          hidden: yes
        }
        dimension: line_item_name {
        }
        dimension: map_region {
          type: string
          map_layer_name: us_states
        }
        dimension: user_mobile_name {

        }

        dimension: event_type {}

        #measures
        measure: impression {
          description: "When the ad is loaded and starts playback"
          type: sum
        }
        measure: video_clicks {
          type: sum
        }
        measure: video_activites {
          type: sum
        }
        measure: video_interactions {
          type: sum
        }

        measure: scene_save {
          type: sum
        }

  measure: frame_select {
    type: sum
  }

  measure: object_highlight {
    type: sum
  }

  measure: object_link {
    type: sum
  }
  measure: primary_cta {
    type: sum
  }
  measure: brand_logo_click {
    type: sum
  }

  measure: total_events {
    type: sum
    sql: ${TABLE}.sum_ct ;;
  }
        #rates
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

        measure: video_clicks_rate {
          type: number
          sql: 1.0 * ${video_clicks} / NULLIF(${impression},0) ;;
          value_format_name: percent_2
          group_label: "Rates"
        }

  drill_fields: [event_date, campaignid, map_region, impression]

      }
