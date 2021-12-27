# Testing no characters after @depends_on
set -Eeuo pipefail

@goal default
@depends_on
    true
