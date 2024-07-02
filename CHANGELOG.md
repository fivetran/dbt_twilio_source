# dbt_twilio_source v0.2.1

- Added explicit float casts to the following numerical fields: `duration, queue_time, num_media, num_segments, count`. These fields are listed as strings by default in the Twilio API, but would only be valuable as numbers. 

# dbt_twilio_source v0.2.0

## 🚨 Breaking Changes 🚨
- Under the hood, we've updated the `_tmp` models to use the `dbt_utils.star` macro instead of a basic `select *` ([PR #6](https://github.com/fivetran/dbt_twilio_source/pull/6)).
  - This means that you can no longer use `var(<table_name>)` to override the source tables we create staging models from. Instead, see the [README](https://github.com/fivetran/dbt_twilio_source?tab=readme-ov-file#change-the-source-table-references) for how to use our `_identifier` variables.
- Removed the deprecated `twilio_using_message` variable. This is a breaking change because you could previously use this variable to disable freshness tests on the `MESSAGE` source table. To continue to do so, leverage dbt [overrides](https://docs.getdbt.com/reference/resource-properties/overrides#configure-your-own-source-freshness-for-a-source-table-in-a-package) to set `message`'s freshness to `null` ([PR #6](https://github.com/fivetran/dbt_twilio_source/pull/6)).

## Features
- Added the ability to disable models related to the `CALL` source table. Refer to the [README](https://github.com/fivetran/dbt_twilio_source?tab=readme-ov-file#step-4-enablingdisabling-models) for more details ([PR #5](https://github.com/fivetran/dbt_twilio_source/pull/5)).

## Under the Hood
- Adjusted the case of loader name from `fivetran` to `Fivetran` in the `src_twilio.yml` file ([PR #5](https://github.com/fivetran/dbt_twilio_source/pull/5)).
- Adjusted the way we dynamically disable source freshness tests for tables that may be missing to use dbt's native `config.enabled` [flag](https://docs.getdbt.com/reference/resource-configs/enabled) ([PR #6](https://github.com/fivetran/dbt_twilio_source/pull/6)).
- Updated the pull request [templates](/.github) ([PR #6](https://github.com/fivetran/dbt_twilio_source/pull/6)).
- Included auto-releaser GitHub Actions workflow to automate future releases ([PR #6](https://github.com/fivetran/dbt_twilio_source/pull/6)).

## Contributors
- [@raphaelvarieras](https://github.com/raphaelvarieras) ([PR #5](https://github.com/fivetran/dbt_twilio_source/pull/5))

# dbt_twilio_source v0.1.0

## Initial Release
This is the first release of Fivetran Twilio dbt package! For more information, refer to the [README](/README.md)
