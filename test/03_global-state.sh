A="unmodified"

@goal modify_a
    A="modified"
    echo "In this scope, A should be modified."
    test "${A}" = "modified"
    B="new variable"

@goal change_dir
    mkdir --parent ./tush-scratch
    cd ./tush-scratch || exit 1

@goal default
@depends_on modify_a change_dir
    echo "In this scope, A should be UNmodified."
    dir_name="$(basename "$(pwd)")"
    test "${A}" = "unmodified" && \
        test "${B:-}" = "" && \
        test "${dir_name}" = "test"
