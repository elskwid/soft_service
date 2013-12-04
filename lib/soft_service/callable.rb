module SoftService
  module Callable
    def self.included(base)
      base.send(:extend, ClassMethods)
      super
    end

    # Default call method, returns self
    def call
      self
    end

    module ClassMethods
      # Default call class method that passes args to the initializer
      # and the block to the call method.
      def call(*args, &block)
        new(*args).call(&block)
      end
    end # ClassMethods
  end # Callable
end # SoftService
