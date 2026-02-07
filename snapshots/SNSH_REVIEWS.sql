{% snapshot SNSH_REVIEWS%}
    {{
        config(
            unique_key="REVIEW_ID",
            strategy="check",
            check_cols=[
                "REVIEW_SCORE",
                "REVIEW_COMMENT_TITLE",
                "REVIEW_COMMENT_MESSAGE",
            ],
        )
    }}

    select *
    from {{ref('STG_Reviews')}}
{% endsnapshot %}
