@shell sh

SCRIPT_NAME="${0}"

should_fail() {
    # ":" isn't valid in `sh`, so the following should generate an error:
    function foo:bar() {
        true
    }
}

@goal always_satisfied
@reached_if true
    # Cause goal to fail if the above @reached_if doesn't work correctly:
    false

@goal needy
@depends_on always_satisfied
    echo "Running a needy goal"

@goal depends_reached_test
@depends_on needy

@goal script_name
    echo "${SCRIPT_NAME}"

@goal fail_on_bash_syntax
    should_fail 2>&1 | grep --fixed-strings --only-matching "\`foo:bar': not a valid identifier"
