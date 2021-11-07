#!/usr/bin/env bash
load bats-extra

# local version: 1.2.0.0

@test "wink for 1" {
    run bash secret_handshake.sh 1
    assert_success
    assert_output "wink"
}

@test "double blink for 10" {
    run bash secret_handshake.sh 2
    assert_success
    assert_output "double blink"
}

@test "close your eyes for 100" {
    run bash secret_handshake.sh 4
    assert_success
    assert_output "close your eyes"
}

@test "jump for 1000" {
    run bash secret_handshake.sh 8
    assert_success
    assert_output "jump"
}

@test "combine two actions" {
    run bash secret_handshake.sh 3
    assert_success
    assert_output "wink,double blink"
}

@test "all possible actions" {
    run bash secret_handshake.sh 15
    assert_success
    assert_output "wink,double blink,close your eyes,jump"
}

@test "do nothing for zero" {
    run bash secret_handshake.sh 0
    assert_success
    assert_output ""
}

@test "reversing no actions still gives no actions" {
    run bash secret_handshake.sh 16
    assert_success
    assert_output ""
}

@test "reversing one action gives the same action" {
    run bash secret_handshake.sh 24
    assert_success
    assert_output "jump"
}

@test "reverse two actions" {
    run bash secret_handshake.sh 19
    assert_success
    assert_output "double blink,wink"
}

@test "reverse all possible actions" {
    run bash secret_handshake.sh 31
    assert_success
    assert_output "jump,close your eyes,double blink,wink"
}
