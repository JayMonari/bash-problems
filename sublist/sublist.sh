#!/usr/bin/env bash

nums1=$(echo "$1" | tr -d "\[\],")
nums2=$(echo "$2" | tr -d "\[\],")

[ -z "$nums1" ] && [ -z "$nums2" ] && echo 'equal' && exit
[ -z "$nums1" ] && [ -n "$nums2" ] && echo 'sublist' && exit
[ -z "$nums2" ] && [ -n "$nums1" ] && echo 'superlist' && exit
[ "$nums1" = "$nums2" ]            && echo 'equal' && exit
[[ $nums2 =~ $nums1 ]]           && echo 'sublist' && exit
[[ $nums1 =~ $nums2 ]]           && echo 'superlist' && exit

echo 'unequal' && exit

