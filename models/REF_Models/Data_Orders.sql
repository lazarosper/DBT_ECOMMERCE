{{ config(
    materialized='incremental',
    unique_key='order_id',
    incremental_strategy='merge' 
) }}

select
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp::date          as purchase_date,
    order_approved_at::date                 as approved_date,
    order_delivered_carrier_date::date       as delivered_carrier_date,
    order_delivered_customer_date::date      as delivered_customer_date,
    order_estimated_delivery_date::date      as order_estimated_delivery_date,
     '{{ invocation_id }}'                   as batch_id
from {{ ref('STG_Orders') }}

{% if is_incremental() %}
where order_purchase_timestamp::date > (
    select max(purchase_date) from {{ this }}
)
{% endif %}
