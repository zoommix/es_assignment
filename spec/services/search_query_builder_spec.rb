# frozen_string_literal: true

RSpec.describe SearchQueryBuilder, type: :service do
  let(:builder)        { SearchQueryBuilder.new(params) }
  let(:params)         { default_params }
  let(:default_params) { { query: 'example' } }

  describe '#call' do
    subject(:query_and_options) { builder.call }

    it 'returns the query and options' do
      expect(query_and_options.first).to eq('example')
      expect(query_and_options.last).to include(
        fields:       [:content],
        highlight:    { tag: '<strong>' },
        misspellings: { edit_distance: 0 },
        page:         1,
        per_page:     15,
        match:        :word_middle,
        operator:     :and
      )
    end
  end

  describe '#match' do
    subject { builder.match }

    context 'when match is not provided' do
      it 'returns default match' do
        is_expected.to eq(:word_middle)
      end
    end

    context 'when match is provided' do
      let(:params) { default_params.merge(match: :word_start) }

      it 'returns provided match' do
        is_expected.to eq(:word_start)
      end
    end
  end

  describe '#operator' do
    subject { builder.operator }

    context 'when operator is not provided' do
      it 'returns default operator' do
        is_expected.to eq(:and)
      end
    end

    context 'when operator is provided' do
      let(:params) { default_params.merge(operator: :or) }

      it 'returns provided operator' do
        is_expected.to eq(:or)
      end
    end
  end

  describe '#misspellings' do
    subject { builder.misspellings }

    context 'when misspellings count is not provided' do
      it 'returns default misspellings count' do
        is_expected.to eq(0)
      end
    end

    context 'when misspellings count is provided' do
      let(:params) { default_params.merge(misspellings: 2) }

      it 'returns provided misspellings count' do
        is_expected.to eq(2)
      end
    end
  end
end
