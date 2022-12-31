#!/bin/bash

Config
name='Les deseo un feliz año nuevo - por GRU996'
correction=0
new_year=$(( $(date +'%Y') + 1))

Trap to reset terminal and exit on Ctrl-C
trap "tput reset; tput cnorm; exit" 2

Hide cursor
tput civis

Initialize variables
line=6
middle_column=$(( $(tput cols) / 3 ))
middle_column=$(( middle_column - 0 ))
color=0

Loop forever
while true; do

Generate random values
random_value=$(( RANDOM % 12 + 12 ))
from_middle=$(( middle_column - random_value ))
column=$(( RANDOM % (random_value) * 2 + 1 + from_middle ))

Set text color and bold
tput setaf $color; tput bold

Display '#' at random column
tput cup 6 $column
echo '#'

Increment color value
color=$(( (color + 7) % 8 ))

Display "HAPPY" at the top of the screen
from_middle=-8 # from left column
for l in H A P P Y
do
tput cup $(( line + 1 )) $(( middle_column + from_middle ))
echo $l
from_middle=$(( from_middle + 1 ))
sleep 0
done

Display "NEW" below "HAPPY"
from_middle=0
for l in N E W
do
tput cup $(( line + 2 )) $(( middle_column + from_middle ))
echo $l
from_middle=$(( from_middle + 1 ))
sleep 0
done

Display "YEAR" below "NEW"
from_middle=8
for l in Y E A R
do
tput cup $(( line + 3 )) $(( middle_column + from_middle ))
echo $l
from_middle=$(( from_middle + 1 ))
sleep 0
done

Calculate number of spaces to center the new year
space_count=$(( middle_column / 9 + correction ))
spaces=""
for (( c=1; c<=$space_count; c++ ))
do
spaces+=" "
done

Display new year using toilet command
tput cup $(( line + 5 )) 1
toilet "${spaces}$new_year" --metal -t

Set text color and bold
tput setaf $color; tput bold

Display '#' at random column
tput cup 10 $column
echo '#'

Display name at the bottom of the screen
tput cup $(( line + 12 )) $(( middle_column - ( ${#name} / 2 ) ))
echo $name
done
