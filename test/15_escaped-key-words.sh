set -Eeuo pipefail

@goal default
    cat << EOF
\@goal foo
\@reached_if
\@depends_on
\@lib
 \@goal \@reached_if \@depends_on \@lib \@goal \@reached_if
EOF
