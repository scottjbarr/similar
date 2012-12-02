# encoding: UTF-8
require 'spec_helper'

describe Similar do

  it "should not calculate pearson score when nothing to compare" do
    score = Similar.pearson_score([], [])
    score.should == 0
  end

  it "should calculate pearson score" do
    a = [2.5, 3.5, 3.0, 3.5, 3.0, 2.5]
    b = [3.0, 3.5, 1.5, 5.0, 3.0, 3.5]

    score = Similar.pearson_score(a, b)
    score.should be_within(0.00001).of(0.39605901719066977)
  end

  it "should raise an exception when calculating pearson score with different array lengths" do
    a = [2.5, 3.5]
    b = [3.0]

    lambda { Similar.pearson_score(a, b) }.should raise_exception(ArgumentError, "Arrays not of equal length")
  end

  it "should calculate euclidian distance score" do
    a = 5.0, 5.0, 5.0, 5.0, 5.0
    b = 4.0, 4.0, 4.0, 4.0, 4.0

    score = Similar.euclidian_distance(a, b)

    score.should be_within(0.00001).of(0.16666666666666666)
  end

end
