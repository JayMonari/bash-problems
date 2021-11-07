#!/usr/bin/env bash

# local version: 1.1.0.0

@test "no factors" {
    expected=""
    run bash prime_factors.sh 1
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "prime number" {
    expected="2"
    run bash prime_factors.sh 2
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "another prime number" {
    expected="3"
    run bash prime_factors.sh 3
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "square of a prime" {
    expected="3 3"
    run bash prime_factors.sh 9
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "product of first prime" {
    expected="2 2"
    run bash prime_factors.sh 4
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "cube of a prime" {
    expected="2 2 2"
    run bash prime_factors.sh 8
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "product of second prime" {
    expected="3 3 3"
    run bash prime_factors.sh 27
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "product of third prime" {
    expected="5 5 5 5"
    run bash prime_factors.sh 625
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "product of first and second primes" {
    expected="2 3"
    run bash prime_factors.sh 6
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "product of primes and non-primes" {
    expected="2 2 3"
    run bash prime_factors.sh 12
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "product of primes" {
    expected="5 17 23 461"
    run bash prime_factors.sh 901255
    (( status == 0 ))
    [[ $output == "$expected" ]]
}

@test "factors include a large prime" {
    expected="11 9539 894119"
    run bash prime_factors.sh 93819012551
    (( status == 0 ))
    [[ $output == "$expected" ]]
}
