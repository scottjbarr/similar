# encoding: UTF-8
require 'spec_helper'

describe Similar do
  describe '.pearson_score' do

    subject { Similar.pearson_score(a, b) }

    context 'nothing to compare' do
      let(:a) { [] }
      let(:b) { [] }

      it { expect(subject).to eq(0) }
    end

    context 'different arrays' do
      let(:a) { [2.5, 3.5, 3.0, 3.5, 3.0, 2.5] }
      let(:b) { [3.0, 3.5, 1.5, 5.0, 3.0, 3.5] }

      it { expect(subject).to be_within(0.00001).of(0.39605901719066977) }
    end

    context 'raise on different array length' do
      let(:a) { [2.5, 3.5] }
      let(:b) { [3.0] }

      let(:message) { 'Arrays not of equal length' }

      it { expect { subject }.to raise_exception(ArgumentError, message) }
    end
  end

  describe '.euclidean_distance' do
    let(:a) { [5.0, 5.0, 5.0, 5.0, 5.0] }
    let(:b) { [4.0, 4.0, 4.0, 4.0, 4.0] }

    subject { Similar.euclidean_distance(a, b) }

    it { expect(subject).to be_within(0.00001).of(0.16666666666666666) }
  end
end
