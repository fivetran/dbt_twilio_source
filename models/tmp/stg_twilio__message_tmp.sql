--To disable this model, set the using_twilio_message variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_twilio_message', True)) }}

select * 
from {{ var('message') }}
