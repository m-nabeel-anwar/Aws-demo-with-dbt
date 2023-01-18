{% snapshot snap_order_data %}
{{
    config(
      target_database='dev',
      target_schema='edw_dev_dbt_snapshort ',
      unique_key='o_orderkey',

      strategy='timestamp',
      updated_at='update_at',
    )
}}

select * from {{ ref('order_data') }}

{% endsnapshot %}