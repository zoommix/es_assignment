# frozen_string_literal: true

class Prompt < ApplicationRecord
  searchkick word_middle: [:content],
             word_start:  [:content],
             highlight:   [:content],
             batch_size:  ENV.fetch('SEARCHKICK_BATCH_SIZE', DEF_BATCH_SIZE).to_i

  validates :content, presence: true
end
