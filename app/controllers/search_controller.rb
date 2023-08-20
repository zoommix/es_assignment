# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    builder        = SearchQueryBuilder.new(search_params)
    query, options = builder.call
    prompts        = Prompt.search(query, **options)

    render 'search/index', locals: { prompts:, query:, builder: }
  end

  private

  def search_params
    params.permit(:commit, :query, :match, :operator, :misspellings)
  end
end
