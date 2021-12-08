
function in_prelude() {
    echo "Function in prelude"
}

@goal a
    echo "Running a..."
    in_prelude
    after_a
    after_b

@lib

function after_a() {
    echo "Function after \`a\`"
}

@goal b
    echo "Running b..."
    in_prelude
    after_a
    after_b

@lib

function after_b() {
    echo "Function after \`b\`"
}
