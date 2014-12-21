require "guard/compat/test/helper"

require "guard/middleman"

RSpec.describe Guard::Middleman do
  let(:options) { {} }
  subject { described_class.new(options) }

  describe '#start' do
    context "without run_on_start option" do
      it "does not build" do
        expect(Kernel).to_not receive(:system)
        subject.start
      end
    end

    context "with run_on_start set to true" do
      let(:options) { {run_on_start: true} }
      it "builds" do
        expect(Kernel).to receive(:system).with("bundle exec middleman build")
        subject.start
      end
    end

    context "with run_on_start set to false" do
      let(:options) { {run_on_start: false} }
      it "does not build" do
        expect(Kernel).to_not receive(:system)
        subject.start
      end
    end
  end

  describe '#run_all' do
    it "builds" do
      expect(Kernel).to receive(:system).with("bundle exec middleman build")
      subject.run_all
    end
  end

  describe '#run_on_change' do
    it "builds" do
      expect(Kernel).to receive(:system).with("bundle exec middleman build")
      subject.run_all
    end
  end
end
