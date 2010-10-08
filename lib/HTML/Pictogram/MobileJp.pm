package HTML::Pictogram::MobileJp;
use strict;
use warnings;
use 5.00800;
our $VERSION = '0.01';
use HTML::Pictogram::MobileJp::EmojiNumber;

# backward compatibility
sub convert { HTML::Pictogram::MobileJp::EmojiNumber::convert(@_) }

1;
__END__

=encoding utf8

=head1 NAME

HTML::Pictogram::MobileJp - 絵文字を一回かいたら、3キャリで表示できるようにするフィルタ

=head1 DESCRIPTION

ドコモの絵文字番号 or 絵文字Unicodeの実態参照でかけば、それを各キャリアでみれるように変換するというライブラリです。

詳細は L<HTML::Pictogram::MobileJp::EmojiNumber>, L<HTML::Pictogram::MobileJp::Unicode> をそれぞれみてください。

