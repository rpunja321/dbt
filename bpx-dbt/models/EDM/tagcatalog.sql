
{{ config(materialized='incremental',unique_key='PI_TAGID') }}


select *
from {{ref('StgTagCatalogVW')}}

