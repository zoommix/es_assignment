# frozen_string_literal: true

RSpec.describe SearchController, type: :controller do
  describe 'GET #index' do
    subject { get :index, params: { query: } }

    let(:builder) { instance_double(SearchQueryBuilder, call: ['example query', {}]) }
    let(:prompts) { double('prompts') }
    let(:query) { 'example query' }

    before do
      allow(SearchQueryBuilder).to receive(:new).and_return(builder)
      allow(Prompt).to receive(:search).and_return(prompts)
      subject
    end

    it 'creates a SearchQueryBuilder instance' do
      expect(SearchQueryBuilder).to have_received(:new).with(controller.send(:search_params))
    end

    it 'calls the call method on the builder' do
      expect(builder).to have_received(:call)
    end

    it 'calls the search method on Prompt with query and options' do
      expect(Prompt).to have_received(:search).with('example query')
    end

    it 'renders the index template with the correct locals' do
      expect(response).to render_template('search/index')
    end
  end

  describe '#search_params' do
    let(:params) { ActionController::Parameters.new(query: 'example query', match: 'word_start', operator: 'or') }

    before do
      allow(controller).to receive(:params).and_return(params)
    end

    it 'permits specific params' do
      result = controller.send(:search_params)
      expect(result).to eq(params.permit(:query, :match, :operator, :misspellings))
    end
  end
end
