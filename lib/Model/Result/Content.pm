package Context::Model::Result::Content;
use DBIx::Class::Candy -components => ['InflateColumn::DateTime'];

table 'content';

column id => {

    data_type => 'int',
    is_auto_increment => 1,
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

column data => {

    data_type => 'TEXT',
    is_nullable => 1,
};

column tags => {

    data_type => 'varchar',
    size => 100,
    is_nullable => 1,
};

column views => {

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