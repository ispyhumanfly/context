package After5::Model::Result::Content;
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

column types => {

    data_type => 'varchar',
    size => 100,
    is_nullable => 1,
};

column tags => {

    data_type => 'varchar',
    size => 100,
    is_nullable => 1,
};

column cities => {

    data_type => 'varchar',
    size => 100,
    is_nullable => 1,
};

column interests => {

    data_type => 'varchar',
    size => 100,
    is_nullable => 1,
};

column pages => {

    data_type => 'varchar',
    size => 50,
    is_nullable => 1,
};

column photos => {

    data_type => 'varchar',
    size => 10000,
    is_nullable => 1,
};

column videos => {

    data_type => 'varchar',
    size => 10000,
    is_nullable => 1,
};

column body => {

    data_type => 'varchar',
    size => 5000,
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
    size => 200,
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

column position => {

    data_type => 'int',
    size => 10,
    is_nullable => 1,
};

column link => {

    data_type => 'varchar',
    size => 1000,
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