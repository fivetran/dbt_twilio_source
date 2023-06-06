
with base as (

    select * 
    from {{ ref('stg_twilio__message_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_twilio__message_tmp')),
                staging_columns=get_message_columns()
            )
        }}
    from base
),

final as (
    
    select 
        _fivetran_synced,
        account_id,
        body,
        created_at,
        date_sent,
        direction,
        error_code,
        error_message,
        from as message_from,
        id as message_id,
        messaging_service_sid,
        num_media,
        num_segments,
        price,
        price_unit,
        status,
        to,
        updated_at
    from fields
)

select *
from final
