use strict;
use warnings;
use JSON;
use Data::Dumper;
use LWP::Simple;

&main;exit;

sub main {
    my $docomo;
    my $ezweb;
    my $softbank;

    my $au;

    my $c_docomo = slurp_json('http://svn.openpear.org/Text_Pictogram_Mobile/trunk/data/docomo_convert.json')->{docomo};
    my $e_docomo = slurp_json('http://svn.openpear.org/Text_Pictogram_Mobile/trunk/data/docomo_emoji.json')->{docomo};
    my $e_softbank = slurp_json('http://svn.openpear.org/Text_Pictogram_Mobile/trunk/data/softbank_emoji.json')->{softbank};
    while (my ($docomo_id, $val) = each %$c_docomo) {
        $ezweb->{$docomo_id}  = $val->{ezweb};
        $docomo->{$docomo_id} = $e_docomo->{$docomo_id}->{unicode};
        if ($val->{softbank} =~ /^\d+$/) {
            $softbank->{$docomo_id} = $e_softbank->{$val->{softbank}}->{unicode};
        } else {
            $softbank->{$docomo_id} = $val->{softbank};
        }
    }

    local $Data::Dumper::Sortkeys = 1;
    local $Data::Dumper::Terse    = 1;
    print "package HTML::Pictogram::MobileJp::EmojiNumber::Map;\n";
    print "use strict;\n";
    print "use warnings;\n";
    print "# This file was generated automatically.\n";
    print "use base qw/Exporter/;\n";
    print "our \@EXPORT = qw/\$DOCOMO \$EZWEB \$SOFTBANK/;\n";
    print "our \$DOCOMO = ";
    print Dumper($docomo);
    print ";\n\n";
    print "our \$EZWEB = ";
    print Dumper($ezweb);
    print ";\n";
    print "our \$SOFTBANK = ";
    print Dumper($softbank);
    print ";\n";
    print "1;\n";
    exit;
}

sub slurp_json {
    my $content = get($_[0]) // die;
    decode_json($content);
}

