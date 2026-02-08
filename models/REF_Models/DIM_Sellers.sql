select * exclude(DBT_SCD_ID,DBT_UPDATED_AT,DBT_VALID_FROM,DBT_VALID_TO)
from {{ ref("SNSH_SELLERS")}}
where dbt_valid_to is null