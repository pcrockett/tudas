@goal default
    # If we can see ./05_working-dir.sh, that means our working directory is
    # the same directory as THIS file.
    test -f ./05_working-dir.sh
