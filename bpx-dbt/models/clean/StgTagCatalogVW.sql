{{ config(materialized="view"
,alias='stgTAGCATALOG') }}

with tagcatalogdata as (

select
stage_raw:PI_TagID::numeric as PI_TAGID,
stage_raw:Historian_Tag_Name::varchar AS HISTORIAN_TAG_NAME,
stage_raw:TagType::varchar AS TAGTYPE,
stage_raw:TagTypeID::numeric AS TAGTYPEID,
stage_raw:Facility_ID::varchar as FACILITY_ID,
stage_raw:CorpID::varchar AS CORPID,
stage_raw:SCADAEquipmentName::varchar as SCADAEQUIPMENTNAME,
stage_raw:Equipment_ID::varchar AS EQUIPMENT_ID,
stage_raw:Equipment_Type::varchar as EQUIPMENT_TYPE,
stage_raw:Product_Type::varchar AS PRODUCT_TYPE,
stage_raw:Tag_Units::varchar as TAG_UNITS,
stage_raw:Scada_Tag_Name::varchar AS SCADA_TAG_NAME

from {{source('historian','STG_TAGCATALOG_UPSTREAM')}} 
where source_filename = 'tag_catalog/upstream/tag_catalog.parquet'

)

select * from tagcatalogdata