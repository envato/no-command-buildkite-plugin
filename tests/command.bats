#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

# Uncomment the following line to debug stub failures
# export BUILDKITE_AGENT_STUB_DEBUG=/dev/tty

@test "has an empty command hook" {
  export BUILDKITE_COMMAND=""

  run "$PWD/hooks/command"

  assert_success
}

@test "has an error when a pipeline command is configured" {
  export BUILDKITE_COMMAND="/script/run.sh"

  run "$PWD/hooks/command"
  
  assert_failure
}