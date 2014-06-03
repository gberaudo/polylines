# Polylines

## Easily handle Google polylines

## Install

Install with Rubygems:

    gem install polylines

## Usage

To encode an array of latitude/longitude pairs:

    >> Polylines::Encoder.encode_points([[38.5, -120.2], [40.7, -120.95], [43.252, -126.453]])
    => "_p~iF~ps|U_ulLnnqC_mqNvxq`@"

To decode a polyline into an array of latitude/longitude pairs:

    >> Polylines::Decoder.decode_polyline("_p~iF~ps|U_ulLnnqC_mqNvxq`@")
    => [[38.5, -120.2], [40.7, -120.95], [43.252, -126.453]]

I wrote this to follow the steps outlined in http://code.google.com/apis/maps/documentation/utilities/polylinealgorithm.html.

Optionally, encode and decode elevation with triplets:

    >> Polylines::Encoder.encode_points([[38.5, -120.2, 23.83], [40.7, -120.95, 24.78], [43.252, -126.453, 27.38]], true)
    => "_p~iF~ps|UohmpC_ulLnnqCopxD_mqNvxq`@_yzN"

    Polylines::Decoder.decode_polyline("_p~iF~ps|UohmpC_ulLnnqCopxD_mqNvxq`@_yzN", true)                                                                                                   
    => [[38.5, -120.2, 23.83], [40.7, -120.95, 24.779999999999998], [43.252, -126.453, 27.38]]
   
## License

Please see LICENSE

## Author

Written by Josh Clayton
