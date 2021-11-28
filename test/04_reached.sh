@goal a
@reached_if [ -f ./tush-scratch/a.txt ]
    touch ./tush-scratch/a.txt

@goal b
@depends_on a
@reached_if [ -f ./tush-scratch/b.txt ]
    touch ./tush-scratch/b.txt

@goal default
@depends_on b
