# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Stack < DaisyuiOnPhlex::Base
      def initialize(**attributes)
        @attributes = attributes
      end

      def view_template(&block)
        div(class: "stack", **@attributes, &block)
      end
    end
  end
end
