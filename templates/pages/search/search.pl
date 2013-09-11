### Search

get '/search' => sub {

    my $self = shift;

    my $dtf      = $MODEL->storage->datetime_parser;
    my $dt_local = DateTime->now;

    # Ads
    my @ads =
      $MODEL->resultset('Content')
      ->search(
        {pages => {like => '%search%'}, types => {like => '%ad_header%'}},
        {order_by => 'id DESC'})->all;

    $self->{'ADS'} = \@ads;

    # Ads Block
    my @ads_block =
      $MODEL->resultset('Content')
      ->search(
        {pages => {like => '%search%'}, types => {like => '%ad_block%'}})
      ->all;

    $self->{'ADS_BLOCK'} = \@ads_block;

    # Search Results

    my @search_results;

    if ($self->param('types') eq 'event') {

        @search_results = $MODEL->resultset('Content')->search(
            {   types          => {like => '%event%'},
                start_datetime => {
                    -between => [
                        $dtf->format_datetime($dt_local),
                        $dtf->format_datetime($dt_local->add(days => 120))
                    ]
                }
            },
            {order_by => 'start_datetime ASC'}
        )->all;

    }
    else {

        @search_results =
          $MODEL->resultset('Content')
          ->search(undef, {order_by => 'id DESC'})->all;
    }

    $self->{'SEARCH_RESULTS'} = \@search_results;

    # Trending
    if ($self->param('trending') eq 'true') {

        $self->{'SEARCH_RESULTS'} = order_by_trending($self, @search_results);

    }
    else {
        $self->{'SEARCH_RESULTS'} = \@search_results;
    }

    return $self->render('pages/search/search');

} => 'search';
