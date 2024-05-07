# dbt_twilio_source v0.1.1

## Features
- Added the ability to disable models related to the `CALL` source table. Refer to the [README](https://github.com/fivetran/dbt_twilio_source?tab=readme-ov-file#step-4-enablingdisabling-models) for more details ([PR #5](https://github.com/fivetran/dbt_twilio_source/pull/5)).

## Under the Hood
- Adjusted the case of loader name in in `src_twilio.yml` ([PR #5](https://github.com/fivetran/dbt_twilio_source/pull/5)).
- Adjusted the way we dynamically disable source freshness tests for tables that may be missing to use dbt's native `config.enabled` [flag](https://docs.getdbt.com/reference/resource-configs/enabled) ([PR #6](https://github.com/fivetran/dbt_twilio_source/pull/6)).
- Updated the pull request [templates](/.github) ([PR #6](https://github.com/fivetran/dbt_twilio_source/pull/6)).
- Included auto-releaser GitHub Actions workflow to automate future releases ([PR #6](https://github.com/fivetran/dbt_twilio_source/pull/6)).

## Contributors
- [@raphaelvarieras](https://github.com/raphaelvarieras) ([PR #5](https://github.com/fivetran/dbt_twilio_source/pull/5))

# dbt_twilio_source v0.1.0

## Initial Release
This is the first release of Fivetran Twilio dbt package! For more information, refer to the [README](/README.md)
