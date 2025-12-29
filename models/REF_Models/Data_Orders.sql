select ORDER_ID, CUSTOMER_ID, order_status,
 ORDER_PURCHASE_TIMESTAMP::date as Purchase_Date, 
 ORDER_APPROVED_AT::date as approved_date, 
 ORDER_DELIVERED_CARRIER_DATE::date as delivered_carrier_date, 
 ORDER_DELIVERED_CUSTOMER_DATE::date as delivered_customer_date , 
 ORDER_ESTIMATED_DELIVERY_DATE::date as ORDER_ESTIMATED_DELIVERY_DATE
 from {{ ref("STG_Orders")}}