# frozen_string_literal: true

class Prompt < ApplicationRecord
  searchkick word_middle: [:content],
             word_start:  [:content],
             highlight:   [:content],
             batch_size:  100

  validates :content, presence: true
end
