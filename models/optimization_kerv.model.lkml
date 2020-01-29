connection: "kerv_rs"

# include all the views
include: "/views/**/*.view"

datagroup: optimization_kerv_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: optimization_kerv_default_datagroup


explore: dwh_advertisers {}

explore: dwh_campaigns {}

explore: dwh_creatives {}

explore: dwh_distributions {}

explore: dwh_ds_summary {}

explore: dwh_geo_summary {
  label: "Geo Summary"
  join: dwh_advertisers {
    type: left_outer
    sql_on: ${dwh_advertisers.id} = ${dwh_geo_summary.advertiserid} ;;
    relationship: many_to_one
  }

}

explore: dwh_lineitems {}

explore: dwh_objects {}

explore: dwh_scenes {}

explore: dwh_ssp_summary {}

explore: dwh_tags {}
