# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    query = params[:query]
    prompts = Prompt.search(
      query,
      fields:       [:content],
      match:        :word_middle,
      operator:     :and,
      highlight:    { tag: '<strong>' },
      misspellings: { edit_distance: 2 },
      page:         0,
      per_page:     10
    )

    render 'search/index', locals: { prompts:, query: }
  end
end
