use inc::Module::Install;
name 'HTML-Pictogram-MobileJp';
all_from 'lib/HTML/Pictogram/MobileJp.pm';

requires 'HTTP::MobileAgent';
requires 'parent';
test_requires 'Test::MobileAgent';

readme_markdown_from 'lib/HTML/Pictogram/MobileJp.pm';
tests 't/*.t t/*/*.t t/*/*/*.t t/*/*/*/*.t';
test_requires 'Test::More';
test_requires 'YAML';
author_tests('xt');
# use_test_base;
auto_include;
WriteAll;
