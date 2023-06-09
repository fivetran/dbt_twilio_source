
with base as (

    select * 
    from {{ ref('stg_twilio__messaging_service_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_twilio__messaging_service_tmp')),
                staging_columns=get_messaging_service_columns()
            )
        }}
    from base
),

final as (
    
    select 
        _fivetran_deleted,
        _fivetran_synced,
        account_id,
        area_code_geomatch,
        created_at,
        fallback_method,
        fallback_to_long_code,
        fallback_url,
        friendly_name,
        id as messaging_service_id,
        inbound_method,
        inbound_request_url,
        mms_converter,
        scan_message_content,
        smart_encoding,
        status_callback,
        sticky_sender,
        synchronous_validation,
        updated_at,
        us_app_to_person_registered,
        use_inbound_webhook_on_number,
        usecase,
        validity_period
    from fields
)

select *
from final
