--To disable this model, set the using_twilio_messaging_service variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_twilio_messaging_service', True)) }}

select * 
from {{ var('messaging_service') }}
