SCRIPT_NAME="${0}"

@goal test_current_directory
    # If we can see ./05_execution-context.sh, that means our working directory is
    # the same directory as THIS file.
    test -f ./05_execution-context.sh

@goal test_script_name
    echo "Executing Tudasfile is ${SCRIPT_NAME}"
