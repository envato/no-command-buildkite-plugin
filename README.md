# No Command Buildkite Plugin

For when you don't want a command. See examples

## Example

Add the following to your `pipeline.yml`:

```yml
steps:
  - label: "Some task"
    plugins:
      - envato/no-command#v0.1.0: ~
      # other plugins omitted
```

Why would you want to do this? Sometimes plugins don't overwrite the `command` hook, but they do everything you want from your build step. `envato/no-command` will ensure you can omit the `command` configuration.

```yml
steps:
  - label: "Upload to s3"
    plugins:
      - envato/no-command#v0.1.0: ~
      - artifacts#v1.2.0:
          download: local-directory/*
      - envato/aws-s3-sync#v0.2.0:
          source: local-directory/
          destination: s3://example-bucket/directory/
```

## Developing

To run the tests:

```shell
docker-compose run --rm tests
```

To run the lint:

```shell
docker-compose run --rm lint
```
