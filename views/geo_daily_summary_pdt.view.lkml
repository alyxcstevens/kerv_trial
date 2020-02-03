view: geo_daily_summary_pdt {


  derived_table: {
    datagroup_trigger: pdt_daily_refresh
#       distribution_style: even
    distribution: "advertiserid"
    sortkeys: ["event_date"]
    # If necessary, uncomment the line below to include explore_source.
# include: "optimization_kerv.model.lkml"

          explore_source: dwh_geo_summary {
            column: event_date {}
            column: advertiserid {}
            column: campaignid {}
            column: line_item_name {}
            column: map_region {}
            column: user_mobile_name {}
            column: impression {}
            column: video_clicks {}
            column: video_activites {}
            column: video_interactions {}
            filters: {
              field: dwh_geo_summary.event_date
              value: "6 months"
            }
          }
        }

        #dimensions
        dimension: event_date {
          label: "Geo Summary Event Date"
          type: date
        }
        dimension: advertiserid {
          label: "Geo Summary Advertiserid"
        }
        dimension: campaignid {
          label: "Geo Summary Campaignid"
        }
        dimension: line_item_name {
          label: "Geo Summary Line Item Name"
        }
        dimension: map_region {
          label: "Geo Summary Map Region"
          type: string
          map_layer_name: us_states
        }
        dimension: user_mobile_name {
          label: "Geo Summary User Mobile Name"
        }

        #measures
        measure: impression {
          label: "Geo Summary Impression"
          description: "When the ad is loaded and starts playback"
          type: sum
        }
        measure: video_clicks {
          label: "Geo Summary Video Clicks"
          type: sum
        }
        measure: video_activites {
          label: "Geo Summary Video Activites"
          type: sum
        }
        measure: video_interactions {
          label: "Geo Summary Video Interactions"
          type: sum
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
