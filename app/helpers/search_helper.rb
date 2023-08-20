# frozen_string_literal: true

module SearchHelper
  MATCHES = [['Word Middle', :word_middle], ['Word Start', :word_start]].freeze
  OPERATORS = [['AND', :and], ['OR', :or]].freeze
  MISSPELLINGS = [['0', 0], ['1', 1], ['2', 2]].freeze

  def match_options
    MATCHES
  end

  def operator_options
    OPERATORS
  end

  def misspellings_options
    MISSPELLINGS
  end
end
