# frozen_string_literal: true

class DummyService < BaseService
  # Dummy implementation
  def call; end
end

RSpec.describe BaseService, type: :service do
  let(:instance)          { instance_double(DummyService, call: nil) }
  subject(:service_class) { DummyService }

  describe '.call' do
    before { allow(DummyService).to receive(:new).and_return(instance) }
    after  { service_class.call }

    it 'creates an instance of the service' do
      expect(service_class).to receive(:new)
    end

    it 'calls the instance method' do
      expect(instance).to receive(:call)
    end
  end

  describe '#call' do
    subject { BaseService.new.call }

    it 'raises NotImplementedError' do
      expect { subject }.to raise_error(NotImplementedError)
    end
  end
end
