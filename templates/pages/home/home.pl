### Home

get '/home' => sub {

    my $self = shift;

    my $dtf = $MODEL->storage->datetime_parser;
    my $dt_local;

    # Ads
    my @ads =
      $MODEL->resultset('Content')
      ->search(
        {pages => {like => '%home%'}, types => {like => '%ad_header%'}})->all;

    $self->{'ADS'} = \@ads;

    # Ads Block
    my @ads_block =
      $MODEL->resultset('Content')
      ->search({pages => {like => '%home%'}, types => {like => '%ad_block%'}})
      ->all;

    $self->{'ADS_BLOCK'} = \@ads_block;

    # Articles
    my @articles = $MODEL->resultset('Content')->search(
        {   types           => {like => '%article%'},
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
        {   types          => {like => '%event%'},
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

    # Galleries
    my @galleries = $MODEL->resultset('Content')->search(
        {   types           => {like => '%gallery%'},
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

    $self->{'GALLERIES'} = \@galleries;

    # Trending
    my @trending;

    push @trending, @articles;
    push @trending, @events;
    push @trending, @galleries;

    $self->{'TRENDING'} = order_by_trending($self, @trending);
    
    return $self->render('pages/home/home');

} => 'home';
