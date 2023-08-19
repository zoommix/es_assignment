# frozen_string_literal: true

class Prompt < ApplicationRecord
  validates :content, presence: true
end
