{% snapshot SNSH_SELLERS%}
    {{
        config(
            unique_key="SELLER_ID",
            strategy="check",
            check_cols=[
                "SELLER_ZIP_CODE_PREFIX"," SELLER_CITY"," SELLER_STATE"
            ],
        )
    }}

    select *
    from {{ref('STG_Sellers')}}
{% endsnapshot %}
