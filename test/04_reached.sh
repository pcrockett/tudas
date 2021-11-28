@goal a
@reached_if [ -f ./a.txt ]
    touch ./a.txt

@goal b
@depends_on a
@reached_if [ -f ./b.txt ]
    touch ./b.txt

@goal default
@depends_on b
