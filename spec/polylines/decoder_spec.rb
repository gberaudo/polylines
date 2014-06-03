require "spec_helper"

describe Polylines::Decoder, ".decode" do
  it "decodes a single point" do
    Polylines::Decoder.decode("`~oia@").should be_within(0.00001).of(-179.9832104)
  end
end

describe Polylines::Decoder, ".decode_polyline" do
  let(:polyline) { "_p~iF~ps|U_ulLnnqC_mqNvxq`@" }
  let(:points)   { [[38.5, -120.2], [40.7, -120.95], [43.252, -126.453]] }

  it "decodes a polyline correctly" do
    Polylines::Decoder.decode_polyline(polyline).should == points
  end
end

describe Polylines::Decoder, ".decode_polyline with points that were close together" do
  it "decodes a polyline correctly" do
    Polylines::Decoder.decode_polyline("krk{FdxdlO?e@").should == [[41.35222, -86.04563],[41.35222, -86.04544]]
  end
end

describe Polylines::Decoder, ".decode_polyline with elevation and rounding" do
  it "decodes a polyline correctly" do
    Polylines::Decoder.decode_polyline("svzmFdgi_Q}|xlCdA?unwvD", true).should == [[39.13594, -94.42435, 23.23423], [39.13559, -94.42435, 53.34234]]
  end
end
