view: geo_daily_summary_pdt {
    derived_table: {
      sql_trigger_value: select current_date ;;
      explore_source: dwh_geo_summary {
        column: event_date {}
        column: advertiserid {}
        column: campaignid {}
        column: line_item_name {}
        column: map_region {}
        column: user_mobile_name {}
        column: video_activities_rate {}
        column: video_clicks_rate {}
        column: video_interactions_rate {}
        column: impression {}
        column: video_clicks {}
        column: video_activites {}
        column: video_interactions {}
        filters: {
          field: dwh_geo_summary.event_date
          value: "3 months"
        }
      }
    }
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
    }
    dimension: user_mobile_name {
      label: "Geo Summary User Mobile Name"
    }
    dimension: video_activities_rate {
      label: "Geo Summary Video Activities Rate"
      value_format: "#,##0.00%"
      type: number
    }
    dimension: video_clicks_rate {
      label: "Geo Summary Video Clicks Rate"
      value_format: "#,##0.00%"
      type: number
    }
    dimension: video_interactions_rate {
      label: "Geo Summary Video Interactions Rate"
      value_format: "#,##0.00%"
      type: number
    }
    dimension: impression {
      label: "Geo Summary Impression"
      description: "When the ad is loaded and starts playback"
      type: number
    }
    dimension: video_clicks {
      label: "Geo Summary Video Clicks"
      type: number
    }
    dimension: video_activites {
      label: "Geo Summary Video Activites"
      type: number
    }
    dimension: video_interactions {
      label: "Geo Summary Video Interactions"
      type: number
    }
  }
