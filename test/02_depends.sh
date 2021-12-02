@goal a
    echo "Running a"

@goal a2
    echo "Running a2"

@goal b
@depends_on a
    echo "Running b"

@goal c
@depends_on b
    echo "Running c"

@goal d
@depends_on a b
    # This goal tests what happens when you have repeated deps - in this case,
    # `a` is a dependency of both `b` and `d`
    echo "Running d"

@goal should_fail
@depends_on a
    false

@goal dependency_should_fail
@depends_on a should_fail
    echo "You should not see this"

@goal multiple_depends
@depends_on a
@depends_on a2
    echo "Running multiple_depends"

@goal default
@depends_on c d
