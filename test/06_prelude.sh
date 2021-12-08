A=123
B=456
# Comments should stay in the prelude.

C=$(cat << EOF
Here docs should
    have their
    indentation
    and
    tailing whitepaces    
    
and empty lines

preserved.
EOF
)

@goal default
    true
