# frozen_string_literal: true

class Prompt < ApplicationRecord
  searchkick word_middle: [:content], highlight: [:content], batch_size: 200

  validates :content, presence: true
end
