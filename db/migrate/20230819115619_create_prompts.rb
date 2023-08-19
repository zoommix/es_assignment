# frozen_string_literal: true

class CreatePrompts < ActiveRecord::Migration[7.0]
  def change
    create_table :prompts, id: :uuid do |t|
      t.string :content, null: false

      t.timestamps
    end
  end
end
