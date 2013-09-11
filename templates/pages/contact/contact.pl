### Contact

get '/contact' => sub {

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

    $self->{'STOCK_PHOTO'} = stock_photo();

    return $self->render('pages/contact/contact');

} => 'contact';

post '/api/contact/message' => sub {

    my $self = shift;

    if ((       $self->param('message')
            and ($self->param('name'))
            and ($self->param('email'))
            and ($self->param('subject'))
        )
      )
    {

        my $domain = app->config->{domain};
        my $title  = app->config->{title};

        my @results = google_local($self->param('city_state_zip'));

        for (@results) {

            my $message =
                "\n\nContact Message from $title...\n\n\tName: "
              . $self->param('name')
              . "\n\n\tEmail: "
              . $self->param('email')
              . "\n\n\tCity/State or Zip: " . ''
              . $_->city . ','
              . $_->region
              . "\n\n\tPhone: "
              . $self->param('phone')
              . "\n\nMessage: \n\n"
              . $self->param('message') . "\n\n";

            my %mail = (

                To      => "contact\@$domain",
                From    => "no-reply\@$domain",
                Subject => "$domain :: " . $self->param('subject'),
                Message => $message
            );

            sendmail(%mail) or die $Mail::Sendmail::error;

            my $text = 'Message successfully sent!';
            return $self->redirect_to("/contact?message=$text");
        }
    }
    else {

        my $text = 'Error sending message. Please try again!';
        return $self->redirect_to("/contact?message=$text");
    }

    return $self->redirect_to('pages/contact/contact');
};
