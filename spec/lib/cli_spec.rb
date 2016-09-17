require 'spec_helper'

describe Squareone::CLI do

  describe '-v, --version' do
    let(:output) { capture(:stdout) { subject.version } }

    it "Prints the version number" do
      expect(output).to include "squareone #{Squareone::VERSION}"
    end
  end
end
