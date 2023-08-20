# frozen_string_literal: true

class BaseService
  def self.call(*args, **kwargs, &block)
    new(*args, **kwargs).call(&block)
  end

  def call
    raise NotImplementedError
  end

  private

  attr_reader :params
end
