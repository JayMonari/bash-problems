#!/usr/bin/env bash
load bats-extra

# local version: 2.0.0.0


@test "paired square brackets" {
    run bash matching_brackets.sh "[]"
    assert_success 
    assert_output "true"
}

@test "empty string" {
    run bash matching_brackets.sh ""
    assert_success 
    assert_output "true"
}

@test "unpaired brackets" {
    run bash matching_brackets.sh "[["
    assert_success 
    assert_output "false"
}

@test "wrong ordered brackets" {
    run bash matching_brackets.sh "}{"
    assert_success 
    assert_output "false"
}

@test "wrong closing bracket" {
    run bash matching_brackets.sh "{]"
    assert_success 
    assert_output "false"
}

@test "paired with whitespace" {
    run bash matching_brackets.sh "{ }"
    assert_success 
    assert_output "true"
}

@test "partially paired brackets" {
    run bash matching_brackets.sh "{[])"
    assert_success 
    assert_output "false"
}

@test "simple nested brackets" {
    run bash matching_brackets.sh "{[]}"
    assert_success 
    assert_output "true"
}

@test "several paired brackets" {
    run bash matching_brackets.sh "{}[]"
    assert_success 
    assert_output "true"
}

@test "paired and nested brackets" {
    run bash matching_brackets.sh "([{}({}[])])"
    assert_success 
    assert_output "true"
}

@test "unopened closing brackets" {
    run bash matching_brackets.sh "{[)][]}"
    assert_success 
    assert_output "false"
}

@test "unpaired and nested brackets" {
    run bash matching_brackets.sh "([{])"
    assert_success 
    assert_output "false"
}

@test "paired and wrong nested brackets" {
    run bash matching_brackets.sh "[({]})"
    assert_success 
    assert_output "false"
}

@test "paired and incomplete brackets" {
    run bash matching_brackets.sh "{}["
    assert_success 
    assert_output "false"
}

@test "too many closing brackets" {
    run bash matching_brackets.sh "[]]"
    assert_success 
    assert_output "false"
}

@test "math expression" {
    run bash matching_brackets.sh "(((185 + 223.85) * 15) - 543)/2"
    assert_success 
    assert_output "true"
}

@test "complex latex expression" {
    run bash matching_brackets.sh "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)"
    assert_success 
    assert_output "true"
}
