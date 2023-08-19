# frozen_string_literal: true

class Prompt < ApplicationRecord
  searchkick word_middle: [:content], highlight: [:content]

  validates :content, presence: true
end
