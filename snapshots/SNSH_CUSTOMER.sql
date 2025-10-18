{% snapshot SNSH_CUSTOMER %}
    {{
        config(
            unique_key="customer_id",
            strategy="check",
            check_cols=[
                "CUSTOMER_ZIP_CODE_PREFIX",
                "CUSTOMER_CITY",
                "CUSTOMER_STATE",
            ],
        )
    }}

    select *
    from {{source('ecommerce', 'customers')}}
{% endsnapshot %}
