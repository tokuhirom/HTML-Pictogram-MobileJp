use strict;
use warnings;
use utf8;
use HTML::Pictogram::MobileJp;
use Test::MobileAgent qw/:all/;
use Test::More;
use HTTP::MobileAgent;

xxx('docomo', '[emoji:1]', '&#xE63E;');
xxx('ezweb', '[emoji:1]', '<img localsrc="44" />');
xxx('softbank', '[emoji:1]', '&#xE04A;');
xxx('nonmobile', '[emoji:1]', '[emoji:1]');

xxx('docomo', '[emoji:1001]', '&#xE70C;'); # 拡張絵文字
xxx('softbank', '[emoji:93]', '［メガネ］'); # unmapped

done_testing;

sub xxx {
    my ($type, $html, $expected) = @_;
    my $ma = HTTP::MobileAgent->new(test_mobile_agent_headers($type));
    is(HTML::Pictogram::MobileJp->convert($ma, $html), $expected);
}

