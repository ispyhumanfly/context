package After5::Model::Result::Settings;
use DBIx::Class::Candy -components => ['InflateColumn::DateTime'];

table 'settings';

column id => {

    data_type => 'int',
    is_auto_increment => 1,
};

column admin => {

    data_type => 'varchar',
    size => 32,
};

column password => {

    data_type => 'varchar',
    size => 1000,
};

column about => {

    data_type => 'varchar',
    size => 10000,
};

column create_datetime => {

    data_type => 'datetime',
    size => 50,
};

primary_key 'id';

1;