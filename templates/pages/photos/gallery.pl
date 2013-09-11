### Gallery

get '/gallery/:id/:index' => [id => qr/\d+/, index => qr/\d+/] => sub {

    my $self = shift;

    my $content =
      $MODEL->resultset('Content')->search({id => $self->param('id')})
      ->single;

    push @{$self->{'PHOTOS'}}, $_ for split /\s+/, $content->photos;

    # Ads
    my @ads = $MODEL->resultset('Content')
      ->search({types => {like => '%ad_header%'}})->all;

    $self->{'ADS'} = \@ads;

    $self->{CONTENT} = $content;

    return $self->render('pages/photos/gallery');

} => 'gallery';

get '/:img' => [img => qr/\w+.img/] => sub {

    my $self = shift;

    my $img = $self->param('img');

    my $content =
      $MODEL->resultset('Content')->search({photos => {like => "%$img%"}})
      ->first;

    my $photo_index;

    for (split /\s+/, $content->photos) {

        $photo_index++;

        if ($_ =~ m/\b$img/) {

            return $self->redirect_to(
                '/gallery/' . $content->id . '/' . $photo_index);
        }
    }

    return $self->render('not_found');
};
