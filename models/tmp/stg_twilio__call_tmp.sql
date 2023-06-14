--To disable this model, set the using_domain_names variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_twilio_call', True)) }}

select * 
from {{ var('call') }}
