#!/bin/sh -x

sequence=
for codon in $(echo "$1" | grep -o ...); do
  case "$codon" in
    AUG)                   sequence="${sequence} Methionine"    ;;
    UUU | UUC)             sequence="${sequence} Phenylalanine" ;;
    UUA | UUG)             sequence="${sequence} Leucine"       ;;
    UCU | UCC | UCA | UCG) sequence="${sequence} Serine"        ;;
    UAU | UAC)             sequence="${sequence} Tyrosine"      ;;
    UGU | UGC)             sequence="${sequence} Cysteine"      ;;
    UGG)                   sequence="${sequence} Tryptophan"    ;;
    UAA | UAG | UGA)       echo "$sequence" | cut -c2- && exit ;;
    *) echo "Invalid codon" && exit 1 ;;
  esac
done

echo "$sequence" | cut -c2-

