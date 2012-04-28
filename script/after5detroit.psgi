#!/usr/bin/env plackup

use Plack::Builder;

builder {
    
  enable 'Deflater';
  require 'script/after5detroit';

};
