use strict;
use warnings;
use English;
use Test::More;
#BEGIN { plan tests => 5 };
BEGIN { plan skip_all => 'SQLite is no longer in scope' };

print STDERR "OpenXPKI::Server::Log: Database Initialization\n" if $ENV{VERBOSE};

our $dbi;
require 't/28_log/common.pl';

## init database

eval { $dbi->init_schema () };
if ($EVAL_ERROR)
{
    ok(0);
    print STDERR "Error: init_schema failed (${EVAL_ERROR})\n";
}
else
{
    ok(1);
}

$dbi->disconnect();
undef $dbi;
ok(1);

`cp t/28_log/sqlite.db t/28_log/sqlite_log.db`;
ok(not $CHILD_ERROR);

1;
