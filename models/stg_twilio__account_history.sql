
with base as (

    select * 
    from {{ ref('stg_twilio__account_history_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_twilio__account_history_tmp')),
                staging_columns=get_account_history_columns()
            )
        }}
    from base
),

final as (
    
    select 
        _fivetran_synced,
        created_at,
        friendly_name,
        id as account_id,
        owner_account_id,
        status,
        type,
        updated_at
    from fields
)

select *
from final
