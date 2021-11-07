#!/usr/bin/env bash
load bats-extra

# local version: 1.1.0.0

# Lists are ordered and sequential: do not sort or reorder them.
# Lists are given in JSON format.


@test "empty lists" {
    run bash sublist.sh "[]" "[]"
    assert_success
    assert_output "equal"
}

@test "empty list within non empty list" {
    run bash sublist.sh "[]" "[1, 2, 3]"
    assert_success
    assert_output "sublist"
}

@test "non empty list contains empty list" {
    run bash sublist.sh "[1, 2, 3]" "[]"
    assert_success
    assert_output "superlist"
}

@test "list equals itself" {
    run bash sublist.sh "[1, 2, 3]" "[1, 2, 3]"
    assert_success
    assert_output "equal"
}

@test "different lists" {
    run bash sublist.sh "[1, 2, 3]" "[2, 3, 4]"
    assert_success
    assert_output "unequal"
}

@test "false start" {
    run bash sublist.sh "[1, 2, 5]" "[0, 1, 2, 3, 1, 2, 5, 6]"
    assert_success
    assert_output "sublist"
}

@test "consecutive" {
    run bash sublist.sh "[1, 1, 2]" "[0, 1, 1, 1, 2, 1, 2]"
    assert_success
    assert_output "sublist"
}

@test "sublist at start" {
    run bash sublist.sh "[0, 1, 2]" "[0, 1, 2, 3, 4, 5]"
    assert_success
    assert_output "sublist"
}

@test "sublist in middle" {
    run bash sublist.sh "[2, 3, 4]" "[0, 1, 2, 3, 4, 5]"
    assert_success
    assert_output "sublist"
}

@test "sublist at end" {
    run bash sublist.sh "[3, 4, 5]" "[0, 1, 2, 3, 4, 5]"
    assert_success
    assert_output "sublist"
}

@test "at start of superlist" {
    run bash sublist.sh "[0, 1, 2, 3, 4, 5]" "[0, 1, 2]"
    assert_success
    assert_output "superlist"
}

@test "in middle of superlist" {
    run bash sublist.sh "[0, 1, 2, 3, 4, 5]" "[2, 3]"
    assert_success
    assert_output "superlist"
}

@test "at end of superlist" {
    run bash sublist.sh "[0, 1, 2, 3, 4, 5]" "[3, 4, 5]"
    assert_success
    assert_output "superlist"
}

@test "first list missing element from second list" {
    run bash sublist.sh "[1, 3]" "[1, 2, 3]"
    assert_success
    assert_output "unequal"
}

@test "second list missing element from first list" {
    run bash sublist.sh "[1, 2, 3]" "[1, 3]"
    assert_success
    assert_output "unequal"
}

@test "order matters to a list" {
    run bash sublist.sh "[1, 2, 3]" "[3, 2, 1]"
    assert_success
    assert_output "unequal"
}

@test "same digits but different numbers" {
    run bash sublist.sh "[1, 0, 1]" "[10, 1]"
    assert_success
    assert_output "unequal"
}
