### Articles

get '/articles' => sub {

    my $self = shift;

    my $dtf = $MODEL->storage->datetime_parser;
    my $dt_local;

    # Ads
    my @ads =
      $MODEL->resultset('Content')
      ->search(
        {pages => {like => '%articles%'}, types => {like => '%ad_header%'}})
      ->all;

    $self->{'ADS'} = \@ads;

    # Ads Block
    my @ads_block =
      $MODEL->resultset('Content')
      ->search(
        {pages => {like => '%articles%'}, types => {like => '%ad_block%'}})
      ->all;

    $self->{'ADS_BLOCK'} = \@ads_block;

    # Articles
    if ($self->param('create_datetime')) {

        $dt_local =
          DateTime->from_epoch(epoch => int($self->param('create_datetime')));
    }
    else {
        $dt_local = DateTime->now;
    }

    my @articles = $MODEL->resultset('Content')->search(
        {   pages           => {like => '%articles%'},
            types           => {like => '%article%'},
            create_datetime => {
                -between => [
                    $dtf->format_datetime($dt_local->subtract(days => app->config->{subtract_day_range})),
                    $dtf->format_datetime(DateTime->now)
                ]
            }
        },
        {order_by => 'create_datetime DESC'}
    )->all;

    $self->{'ARTICLES'} = \@articles;

    # Trending
    my @trending = $MODEL->resultset('Content')->search(
        {   pages           => {like => '%articles%'},
            types           => {like => '%article%'},
            create_datetime => {
                -between => [
                    $dtf->format_datetime($dt_local),
                    $dtf->format_datetime(DateTime->now)
                ]
            }
        },
        {order_by => 'create_datetime DESC'}
    )->all;

    $self->{'TRENDING'} = order_by_trending($self, @trending);

    return $self->render('pages/articles/articles');

} => 'articles';
