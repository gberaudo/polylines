#!/usr/bin/env ruby

require 'polylines'

# Would be nice to handle piping from stdin

case ARGV[0]
when "encode2"
  print Polylines::Encoder.encode_points([ARGV[1].split(",").map(&:to_f)], false) , "\n"
when "encode3"
  print Polylines::Encoder.encode_points([ARGV[1].split(",").map(&:to_f)], true) , "\n"
when "decode3"
  print Polylines::Decoder.decode_polyline(ARGV[1], true), "\n"
when "decode2"
  print Polylines::Decoder.decode_polyline(ARGV[1], false), "\n"
else
  puts "encode/decode sth"
end
