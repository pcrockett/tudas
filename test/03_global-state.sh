A="unmodified"

@goal modify_a
    A="modified"
    echo "In this scope, A should be modified."
    test "${A}" = "modified"
    B="new variable"

@goal default
@depends_on modify_a
    echo "In this scope, A should be UNmodified."
    test "${A}" = "unmodified" && test "${B:-}" = ""
