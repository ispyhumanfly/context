use local::lib 'lib/perl5';

use base qw/DBIx::Class::Schema/;
package Context;

our $VERSION = '3.0.0';

__PACKAGE__->load_namespaces();

1;
