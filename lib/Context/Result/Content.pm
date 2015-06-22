use local::lib 'lib/perl5';

package Context::Result::Content;
use DBIx::Class::Candy -components => ['InflateColumn::DateTime'];

table 'content';

column id => {

    data_type => 'int',
    is_auto_increment => 1,
};

column author => {

    data_type => 'varchar',
    size => 100,
    is_nullable => 1,
};

column title => {

    data_type => 'varchar',
    size => 100,
    is_nullable => 1,

};

column body => {

    data_type => 'varchar',
    size => 100000,
    is_nullable => 1,
};

column tags => {

    data_type => 'varchar',
    size => 100000,
    is_nullable => 1,
};

column objects => {

    data_type => 'varchar',
    size => 1000000000000,
    is_nullable => 1,
};

column sku => {

    data_type => 'varchar',
    size => 100,
    is_nullable => 1,
};

column stock => {

    data_type => 'int',
    size => 1000000,
    is_nullable => 1,
};

column price => {

    data_type => 'varchar',
    size => 50,
    is_nullable => 1,
};

column create_datetime => {

    data_type => 'datetime',
    size => 50,
};

column modified_datetime => {

    data_type => 'datetime',
    size => 50,
    is_nullable => 1,
};

column start_datetime => {

    data_type => 'datetime',
    size => 100,
    is_nullable => 1,
};

column stop_datetime => {

    data_type => 'datetime',
    size => 100,
    is_nullable => 1,
};

column venue => {

    data_type => 'varchar',
    size => 50,
    is_nullable => 1,
};

column address => {

    data_type => 'varchar',
    size => 100,
    is_nullable => 1,
};

column lat => {

    data_type => 'float',
    size => 50,
    is_nullable => 1,
};

column lng => {

    data_type => 'float',
    size => 50,
    is_nullable => 1,
};

column impressions => {

    data_type => 'int',
    size => 1000000000000,
    is_nullable => 1,
};

column clicks => {

    data_type => 'int',
    size => 1000000000000,
    is_nullable => 1,
};

primary_key 'id';

1;
