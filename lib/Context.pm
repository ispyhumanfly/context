use local::lib 'lib/perl5';

package Context;
use base qw/DBIx::Class::Schema/;

our $VERSION = '3.0.0';

__PACKAGE__->load_namespaces();

1;
