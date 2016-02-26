#!/usr/bin/perl
use strict; use warnings;

  &help if $#ARGV == -1;

  open  IN, "<:utf8", $ARGV[0] or die "$!\n";
  open  IN2, "<:utf8", $ARGV[0] or die "$!\n";
  open OUT, ">:utf8", "codepoints.json" or die "$!\n";
  
  printf OUT '{'."\n".'    "codepoints": ['."\n";

  while (<IN>) {
    my @a = unpack("U*", $_);
    foreach my $s (@a) {
      printf OUT "        %04X,\n",hex( $s);
   }
}


  printf OUT '    ],'."\n".'    "characters": ['."\n";
  while (<IN2>) {
    my @a = unpack("U*", $_);
    foreach my $s (@a) {


      printf OUT '        "%s",'."\n",chr($s);
   
}



}
   printf OUT '    "max_height": 21'."\n".']';


  close IN;
  close IN2;
  close OUT;





sub help {
  die <<TEXT;

Generating codepoints.json from poEditor Pebble language file.

Other Uniocode files could be converted. 

Made by SUNG HyungJu (sungkisa)

:

        Usage:
                perl codepoints-tool.pl <Text File or .po File>

        Example:
                perl codepoints-tool.pl 000.po
                perl codepoints-tool.pl strings.txt

        Output (JSON):
                codepoints.json

TEXT
}

