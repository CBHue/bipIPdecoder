#!perl

use strict;

my $d = shift;
my ($host,$port,undef) = split(/\./, $d);

my $h = sprintf("%X",$host);
$h =~ /(\w\w)(\w\w)(\w\w)(\w\w)/;

my $ip = "$4_$3_$2_$1";
my $loc = hexer($ip);
my $p = portER($port);

print "$loc\n";
print "$p\n";


sub portER(){
   my $p2 = shift;
   my $nP = undef;
   my $port2 = sprintf("%X",$p2);
   foreach ($port2 =~ /\w{2}/g){
      $nP = $_ . $nP;
   }
   my $nP = sprintf("%d", hex("$nP"));
   return $nP;
}


sub hexer(){
   my $i = shift;
   my $o;
   foreach (split(/_/, $i)){
      my $p = sprintf("%d", hex("$_"));
      $o = $o  . $p . ".";
   }
   chop $o;
   return $o;
}
