### Photos

get '/photos' => sub {

    my $self = shift;

    my $dtf = $MODEL->storage->datetime_parser;
    my $dt_local;

    # Ads
    my @ads =
      $MODEL->resultset('Content')
      ->search(
        {pages => {like => '%photos%'}, types => {like => '%ad_header%'}},
        {order_by => 'id DESC'})->all;

    $self->{'ADS'} = \@ads;

    # Ads Block
    my @ads_block =
      $MODEL->resultset('Content')
      ->search(
        {pages => {like => '%photos%'}, types => {like => '%ad_block%'}})
      ->all;

    $self->{'ADS_BLOCK'} = \@ads_block;

    # Galleries
    my @galleries = $MODEL->resultset('Content')->search(
        {   pages           => {like => '%photos%'},
            types           => {like => '%gallery%'},
            create_datetime => {
                -between => [
                    $dtf->format_datetime(
                        DateTime->now->subtract(days => 120)
                    ),
                    $dtf->format_datetime(DateTime->now)
                ]
            }
        },
        {order_by => 'create_datetime DESC'}
    )->all;

    $self->{'GALLERIES'} = \@galleries;

    # Trending
    $self->{'TRENDING'} = order_by_trending($self, @galleries);

    return $self->render('pages/photos/photos');

} => 'photos';

require "templates/pages/photos/gallery.pl";
