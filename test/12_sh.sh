@shell sh

SCRIPT_NAME="${0}"

should_fail() {
    # ":" isn't valid in `sh`, so this should generate an error.
    function foo:bar() {
        true
    }
}

@goal a
@reached_if false
    echo "Running a"

@goal b
@depends_on a
    echo "Running b"

@goal depends_reached_test
@depends_on b
    true

@goal script_name
    echo "${SCRIPT_NAME}"

@goal fail_on_bash_syntax
    should_fail 2>&1 | grep --fixed-strings --only-matching "\`foo:bar': not a valid identifier"
