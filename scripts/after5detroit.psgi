#!/usr/bin/env plackup

use Plack::Builder;

builder {
    
  enable 'Deflater';
  require 'scripts/after5detroit';

};
