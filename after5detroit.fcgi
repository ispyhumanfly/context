#!/usr/bin/env plackup -s FCGI

use Plack::Builder;

builder {
    
  enable 'Deflater';
  require 'after5detroit';

};
