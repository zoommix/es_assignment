# frozen_string_literal: true

class Prompt < ApplicationRecord
  searchkick

  validates :content, presence: true
end
