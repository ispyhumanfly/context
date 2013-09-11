### About

get '/about' => sub {

    my $self = shift;

    # Ads
    my @ads =
      $MODEL->resultset('Content')
      ->search(
        {pages => {like => '%about%'}, types => {like => '%ad_header%'}},
        {order_by => 'id DESC'})->all;

    $self->{'ADS'} = \@ads;

    # Ads Block
    my @ads_block =
      $MODEL->resultset('Content')
      ->search(
        {pages => {like => '%about%'}, types => {like => '%ad_block%'}})->all;

    $self->{'ADS_BLOCK'} = \@ads_block;

    # Staff
    my @staff = $MODEL->resultset('Content')->search(
        {   pages => {like => '%about'},
            tags  => {like => '%after5_staff%'}
        },
        {order_by => 'position ASC'}
    )->all;

    $self->{'STAFF'} = \@staff;

    # Press
    my @press = $MODEL->resultset('Content')->search(
        {   pages => {like => '%about'},
            tags  => {like => '%after5_press%'}
        },
        {order_by => 'id DESC'}
    )->all;

    $self->{'PRESS'} = \@press;

    $self->{'STOCK_PHOTO'} = stock_photo();

    return $self->render('pages/about/about');

} => 'about';
