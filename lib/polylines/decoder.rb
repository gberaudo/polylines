module Polylines
  class Decoder < Base
    def self.decode_polyline(polyline, use_elevation = nil)
      points_with_deltas = transform_to_array_of_lat_lng_and_deltas(polyline, use_elevation)

      [].tap do |points|
        if use_elevation
          points << [points_with_deltas.shift, points_with_deltas.shift, points_with_deltas.shift]
        else
          points << [points_with_deltas.shift, points_with_deltas.shift]
        end

        while points_with_deltas.any?
          if use_elevation
            points << [
              points.last[0] + points_with_deltas.shift,
              points.last[1] + points_with_deltas.shift,
              points.last[2] + points_with_deltas.shift
            ]
          else
            points << [
              points.last[0] + points_with_deltas.shift,
              points.last[1] + points_with_deltas.shift
            ]
          end
        end
      end
    end

    def self.decode(string)
      self.new(string).tap do |decoding|
        decoding.step_11
        decoding.step_10
        decoding.step_8
        decoding.step_7
        decoding.step_6
        decoding.step_5
        decoding.step_4
        decoding.step_3
        decoding.step_2
      end.current_value
    end
  end
end
