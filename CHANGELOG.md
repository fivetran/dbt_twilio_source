# dbt_twilio_source v0.5.0

[PR #15](https://github.com/fivetran/dbt_twilio_source/pull/15) includes the following updates:

## Breaking Change for dbt Core < 1.9.6

> *Note: This is not relevant to Fivetran Quickstart users.*

Migrated `freshness` from a top-level source property to a source `config` in alignment with [recent updates](https://github.com/dbt-labs/dbt-core/issues/11506) from dbt Core. This will resolve the following deprecation warning that users running dbt >= 1.9.6 may have received:

```
[WARNING]: Deprecated functionality
Found `freshness` as a top-level property of `twilio` in file `models/src_twilio.yml`. The `freshness` top-level property should be moved into the `config` of `twilio`.
```

**IMPORTANT:** Users running dbt Core < 1.9.6 will not be able to utilize freshness tests in this release or any subsequent releases, as older versions of dbt will not recognize freshness as a source `config` and therefore not run the tests.

If you are using dbt Core < 1.9.6 and want to continue running Twilio freshness tests, please elect **one** of the following options:
  1. (Recommended) Upgrade to dbt Core >= 1.9.6
  2. Do not upgrade your installed version of the `twilio_source` package. Pin your dependency on v0.4.0 in your `packages.yml` file.
  3. Utilize a dbt [override](https://docs.getdbt.com/reference/resource-properties/overrides) to overwrite the package's `twilio` source and apply freshness via the previous release top-level property route. This will require you to copy and paste the entirety of the previous release `src_twilio.yml` file and add an `overrides: twilio_source` property.

## Documentation
- Corrected references to connectors and connections in the README. ([#14](https://github.com/fivetran/dbt_twilio_source/pull/14))

## Under the Hood
- Updates to ensure integration tests use latest version of dbt.

# dbt_twilio_source v0.4.0

[PR #13](https://github.com/fivetran/dbt_twilio_source/pull/13) includes the following updates:

## Features
- Added the ability to disable the `USAGE_RECORD` source table and its downstream fields via variable `using_twilio_usage_record` (default `true`). Refer to the [README](https://github.com/fivetran/dbt_twilio_source?tab=readme-ov-file#step-4-enablingdisabling-models) for more details.

# dbt_twilio_source v0.3.0

## 🚨 Breaking Changes 🚨
- Added explicit float casts to the following numerical fields: `queue_time, num_media, num_segments` in addition to the existing `duration, price, count, usage` fields and removed any potential non-numerical characters. These fields are listed as strings by default in the Twilio API, but would only be valuable as numbers. Marked as a breaking change, in case you happen to expect string values from these fields.

## Under the Hood
- Created a `remove_non_numeric_chars` macro that uses the `REGEXP_REPLACE` function to clean up any non-numerical characters from the above fields.

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
