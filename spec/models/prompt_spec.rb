# frozen_string_literal: true

RSpec.describe Prompt, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:content) }
  end
end
