
{% snapshot snap_short_order %}



{{
    config(
      target_database='dev',
      target_schema='edw_dev_dbt',
      unique_key='o_orderkey',

      strategy='timestamp',
      updated_at='updated_at',
    )
}}

select * from {{ ref('snap_order') }}

{% endsnapshot %}

