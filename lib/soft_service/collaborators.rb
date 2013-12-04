module SoftService
  module Collaborators
    def self.included(base)
      base.send(:extend, ClassMethods)
      super
    end

    # Instance level access to the collaborators
    def collaborators
      self.class.collaborators
    end

    module ClassMethods
      # Provides a collaborators class method to set them up in your service.
      #
      # i.e.
      #   collaborators :a, :b, :c
      def collaborators(*names)
        return @collaborators if names.empty?

        @collaborators = names

        create_readers
        create_initializer
      end

      private

      # Creates an attr_reader for each collaborator
      def create_readers
        collaborators.each { |name| attr_reader name.to_sym }
      end

      # Also adds a simple initializer that takes each argument, maps it to
      # one of the declared collaborators, and sets the ivar for that value.
      #
      # i.e.
      #   collaborators :a, :b, :c
      #
      #   service = Service.new("a", "b", "c")
      #
      #   service.a  # => "a"
      #   service.b  # => "b"
      #   service.c  # => "c"
      def create_initializer
        initializer = %Q{
          def initialize(#{collaborators.join(", ")})
            #{collaborators.map{|c| "@#{c} = #{c}\n"}.join("")}
          end
        }

        module_eval initializer
      end
    end # ClassMethods
  end # Collaborators
end # SoftService
