#!/usr/bin/env bash

# local version: 1.7.0.0

# Check if the given string is an isogram

@test 'empty string' {
  run bash isogram.sh ''
  (( status == 0 ))
  [[ $output == "true" ]]
}

@test 'isogram with only lower case characters' {
  run bash isogram.sh 'isogram'
  (( status == 0 ))
  [[ $output == "true" ]]
}

@test 'word with one duplicated character' {
  run bash isogram.sh 'eleven'
  (( status == 0 ))
  [[ $output == "false" ]]
}

@test 'word with one duplicated character from the end of the alphabet' {
  run bash isogram.sh 'zzyzx'
  (( status == 0 ))
  [[ $output == "false" ]]
}

@test 'longest reported english isogram' {
  run bash isogram.sh 'subdermatoglyphic'
  (( status == 0 ))
  [[ $output == "true" ]]
}

@test 'word with duplicated character in mixed case' {
  run bash isogram.sh 'Alphabet'
  (( status == 0 ))
  [[ $output == "false" ]]
}

@test 'hypothetical isogrammic word with hyphen' {
  run bash isogram.sh 'thumbscrew-japingly'
  (( status == 0 ))
  [[ $output == "true" ]]
}

@test 'isogram with duplicated hyphen' {
  run bash isogram.sh 'six-year-old'
  (( status == 0 ))
  [[ $output == "true" ]]
}

@test 'hypothetical word with duplicated character following hyphen' {
  run bash isogram.sh 'thumbscrew-jappingly'
  (( status == 0 ))
  [[ $output == "false" ]]
}

@test 'made-up name that is an isogram' {
  run bash isogram.sh 'Emily Jung Schwartzkopf'
  (( status == 0 ))
  [[ $output == "true" ]]
}

@test 'duplicated character in the middle' {
  run bash isogram.sh 'accentor'
  (( status == 0 ))
  [[ $output == "false" ]]
}

@test 'word with duplicated character in mixed case, lowercase first' {
  run bash isogram.sh 'alphAbet'
  (( status == 0 ))
  [[ $output == "false" ]]
}

@test 'same first and last characters' {
  run bash isogram.sh 'angola'
  (( status == 0 ))
  [[ $output == "false" ]]
}

@test 'word with duplicated character and with two hyphens' {
  run bash isogram.sh 'up-to-date'
  (( status == 0 ))
  [[ $output == "false" ]]
}
