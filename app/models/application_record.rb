# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  DEF_BATCH_SIZE = 1000

  primary_abstract_class
end
