connection: "kerv_rs"

# include all the views
include: "/views/**/*.view"

datagroup: geo_summary {
   sql_trigger: SELECT max(day || hour) FROM public.dwh_geo_summary LIMIT 10;;
  #max_cache_age: "1 hour"
}

persist_with: geo_summary


explore: dwh_geo_summary {
  label: "Geo Summary"
  join: dwh_advertisers {
    view_label: "Advertisers"
    type: left_outer
    sql_on: ${dwh_advertisers.id} = ${dwh_geo_summary.advertiserid} ;;
    relationship: many_to_one
  }

}

#optimized pdt explore
explore: geo_daily_summary_pdt {
  label: "Geo Daily Summary PDT"
  join: dwh_advertisers {
    view_label: "Advertisers"
    type: left_outer
    sql_on: ${dwh_advertisers.id} = ${geo_daily_summary_pdt.advertiserid}.advertiserid} ;;
    relationship: many_to_one
  }

}
