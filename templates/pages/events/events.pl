### Events

get '/events' => sub {

    my $self = shift;

    my $dtf = $MODEL->storage->datetime_parser;
    my $dt_local;

    # Ads
    my @ads =
      $MODEL->resultset('Content')
      ->search(
        {pages => {like => '%events%'}, types => {like => '%ad_header%'}})
      ->all;

    $self->{'ADS'} = \@ads;

    # Ads Block
    my @ads_block =
      $MODEL->resultset('Content')
      ->search(
        {pages => {like => '%events%'}, types => {like => '%ad_block%'}})
      ->all;

    $self->{'ADS_BLOCK'} = \@ads_block;

    # Events
    if ($self->param('start_datetime')) {

        $dt_local =
          DateTime->from_epoch(epoch => int($self->param('start_datetime')));
    }
    else {
        $dt_local = DateTime->now;
    }

    my @events = $MODEL->resultset('Content')->search(
        {   pages          => {like => '%events%'},
            types          => {like => '%event%'},
            start_datetime => {
                -between => [
                    $dtf->format_datetime($dt_local),
                    $dtf->format_datetime($dt_local->add(days => 90))
                ]
            }
        },
        {order_by => 'start_datetime ASC'}
    )->all;

    $self->{'EVENTS'} = \@events;

    # Trending
    my @trending = $MODEL->resultset('Content')->search(
        {   pages          => {like => '%events%'},
            types          => {like => '%event%'},
            start_datetime => {
                -between => [
                    $dtf->format_datetime(DateTime->now),
                    $dtf->format_datetime(DateTime->now->add(days => 30))
                ]
            }
        },
        {order_by => 'start_datetime ASC'}
    )->all;

    $self->{'TRENDING'} = order_by_trending($self, @trending);

    return $self->render('pages/events/events');

} => 'events';
