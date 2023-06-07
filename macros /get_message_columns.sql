{% macro get_message_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "account_id", "datatype": dbt.type_string()},
    {"name": "body", "datatype": dbt.type_string()},
    {"name": "created_at", "datatype": dbt.type_timestamp()},
    {"name": "date_sent", "datatype": dbt.type_timestamp()},
    {"name": "direction", "datatype": dbt.type_string()},
    {"name": "error_code", "datatype": dbt.type_string()},
    {"name": "error_message", "datatype": dbt.type_string()},
    {"name": "from", "datatype": dbt.type_string(), "alias": "message_from"},
    {"name": "id", "datatype": dbt.type_string()},
    {"name": "messaging_service_sid", "datatype": dbt.type_string()},
    {"name": "num_media", "datatype": dbt.type_string()},
    {"name": "num_segments", "datatype": dbt.type_string()},
    {"name": "price", "datatype": dbt.type_string()},
    {"name": "price_unit", "datatype": dbt.type_string()},
    {"name": "status", "datatype": dbt.type_string()},
    {"name": "to", "datatype": dbt.type_string(), "alias": "message_to"},
    {"name": "updated_at", "datatype": dbt.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
