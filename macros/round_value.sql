{%- macro round_value_macro(colname , round_val=2) -%}

round(1.0 * {{colname}} /100 , {{round_val}})

{%- endmacro -%}
