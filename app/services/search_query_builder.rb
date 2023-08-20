# frozen_string_literal: true

class SearchQueryBuilder < BaseService
  BASE_PARAMS = {
    fields: %i[content]
  }.freeze

  DEF_MATCH = :word_middle
  DEF_OPERATOR = :and
  DEF_MISSPELLINGS = 0
  DEF_PAGE = 1
  DEF_PER_PAGE = 15

  def initialize(params)
    super()
    @params = params
  end

  def call
    [query, options]
  end

  def match
    return params[:match] if params[:match].present?

    DEF_MATCH
  end

  def operator
    return params[:operator] if params[:operator]

    DEF_OPERATOR
  end

  def misspellings
    return params[:misspellings] if params[:misspellings]

    DEF_MISSPELLINGS
  end

  private

  attr_reader :params

  def query
    params[:query]
  end

  def options
    BASE_PARAMS.merge(
      highlight:    { tag: '<strong>' },
      misspellings: { edit_distance: misspellings },
      page:         DEF_PAGE,
      per_page:     DEF_PER_PAGE,
      match:,
      operator:
    )
  end
end
