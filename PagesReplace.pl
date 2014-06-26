#!/usr/bin/perl
use utf8;
use Unicode::Collate::Locale;
use Unicode::Collate::CJK::Pinyin;

binmode(STDIN, ':encoding(utf8)');
binmode(STDOUT, ':encoding(utf8)');
binmode(STDERR, ':encoding(utf8)');

my $Collator = new Unicode::Collate::Locale::
			 locale => "zh__pinyin",
			 level  => 1,
			 normalization => undef,
			# overrideCJK => \&Unicode::Collate::CJK::Pinyin::weightPinyin
			;
			
use constant MAXLEVEL => 3;
open PAGES, "<:encoding(UTF-8)", "Pages.txt";

$total_eng_pgs=0;

while(<PAGES>){
	chomp;
	s/^(\x{FEFF}|\x{200B})+//;
	
	if (/^\s*(\d+)\s*\|\s*(\d+)\s*$/){
		$pgtable[$1]=$2;
		$total_eng_pgs++;
		#print $1 . " " . $2 . "\n";
	}
}

close PAGES;

print "$total_eng_pgs ";

open INDEX_IN, "<:encoding(UTF-8)", "Index.txt";

$i=0;

while(<INDEX_IN>){
    chomp;
	s/^(\x{FEFF}|\x{200B})+//;
	if (/^\s*(\d+)\s*\|\s*([^\|]+)\s*\|\s*([^\|]*)((\s*\|\s*([^\|]+))|\s*)\s*$/){
		$i++;
		$level[$i]=$1;
		$engname[$i]=$2;
		$chnname=$3;
		$pages=$6;
		if($chnname eq ""){
			$chnname=$engname[$i];
			$engname[$i]="";
		}

		
		$chnname_uplevel[$level[$i]]=$chnname;
		
		for($l=1;$l<=$level[$i]-1;$l++){
			$chn_nm_l[$i][$l]=$chnname_uplevel[$l];
		}
		
		$chn_nm_l[$i][$level[$i]]=$chnname;
		
		for($l=$level[$i]+1;$l<=MAXLEVEL;$l++){
			$chn_nm_l[$i][$l]="";
		}
		
		
		@pgfields=split /([-,\s]+)/, $pages;
		
		open my ($PGS_REPLACED_FH), ">:encoding(UTF-8)", \$pages_replaced;
		
		#print @pgfields;
		$lastpgf="";
		
		foreach (@pgfields){
			if (not (($_ eq "-") or ($lastpgf eq "-"))){
				if (/(\d+)(f?)/){
					print $PGS_REPLACED_FH "$pgtable[$1]$2";
				}else{
					print $PGS_REPLACED_FH $_;
				}
			}
			
			$lastpgf=$_;
		}	
		close $PGS_REPLACED_FH;
		$pages_r[$i]=$pages_replaced;
		
	}
}
close INDEX_IN;

$total_index_entities=$i;
print "$total_index_entities\n";

@indices=1..$total_index_entities;

@indices=sort by_chn_nm @indices;

#	$chn_nm_l[$a][1] <=> $chn_nm_l[$b][1] or
#	$chn_nm_l[$a][2] <=> $chn_nm_l[$b][2] or
#	$chn_nm_l[$a][3] <=> $chn_nm_l[$b][3];

#print @indices;

open INDEX_OUT, ">:encoding(UTF-8)", "Index_out.txt";

foreach (@indices){
	#print INDEX_OUT "$_ \| $level[$_] \| $chn_nm_l[$_][1] \| $chn_nm_l[$_][2] \| $chn_nm_l[$_][3] \| $engname[$_] \| $pages_r[$_]\n";
	print INDEX_OUT "\t" x ($level[$_]-1);
	print INDEX_OUT $chn_nm_l[$_][$level[$_]];
	
	if ($engname[$_] ne ""){
		print INDEX_OUT "（$engname[$_]）";
	}
	
	if ($pages_r[$_] ne ""){
		print INDEX_OUT ", ";
		print INDEX_OUT $pages_r[$_];
	}
	print INDEX_OUT "\n";
}

close INDEX_OUT;


sub by_chn_nm {

	for($l=1; $l<=MAXLEVEL; $l++){
		$res=$Collator->cmp($chn_nm_l[$a][$l], $chn_nm_l[$b][$l]);
		#print "\t $l $chn_nm_l[$a][$l] $chn_nm_l[$b][$l] $res\n";
		if ($res!=0){
			last;
		}
	}
	#print "$a $b $res\n";
	$res;

}

