#!/bin/perl -w

use Bio::Seq;
use Bio::Tools::SeqStat;

$seq_obj = Bio::Seq->new(-seq => 'aaaatgggggggggggccccgtt',
                         -alphabet => 'dna' );

print($seq_obj)

