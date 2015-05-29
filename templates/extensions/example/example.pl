use Module::Loaded;

### Example

get '/extensions/example' => sub {

    my $self = shift;

    my $dtf = $MODEL->storage->datetime_parser;
    my $dt_local;

    # Articles
    my @articles = $MODEL->resultset('Content')->search(
        {   tags           => {like => '%article%'},
            create_datetime => {
                -between => [
                    $dtf->format_datetime(
                        DateTime->now->subtract(days => app->config->{subtract_day_range})
                    ),
                    $dtf->format_datetime(DateTime->now)
                ]
            }
        },
        {order_by => 'create_datetime DESC'}
    )->all;

    $self->{'ARTICLES'} = \@articles;

    # Events
    my @events = $MODEL->resultset('Content')->search(
        {   tags          => {like => '%event%'},
            start_datetime => {
                -between => [
                    $dtf->format_datetime(DateTime->now),
                    $dtf->format_datetime(DateTime->now->add(days => app->config->{add_day_range}))
                ]
            }
        },
        {order_by => 'start_datetime ASC'}
    )->all;

    $self->{'EVENTS'} = \@events;

    # Trending
    my @trending;

    push @trending, @articles;
    push @trending, @events;

    $self->{'TRENDING'} = order_by_trending($self, @trending);
    
    return $self->render('extensions/example/example');

} => 'example';
