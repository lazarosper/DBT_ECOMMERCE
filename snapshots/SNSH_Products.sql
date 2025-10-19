{% snapshot SNSH_Products %}
    {{
        config(
            unique_key="PRODUCT_ID",
            strategy="check",
            check_cols=[
                "PRODUCT_CATEGORY_NAME"
            ],
        )
    }}

    select *
    from {{ref('STG_Products')}}
{% endsnapshot %}
