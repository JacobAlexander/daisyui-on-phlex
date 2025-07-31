# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Validator < DaisyuiOnPhlex::Base
      def initialize(
        state: nil, # :valid, :invalid, nil for neutral
        **attributes
      )
        @state = state
        @attributes = attributes
      end

      def view_template(&block)
        div(class: validator_classes, **@attributes, &block)
      end

      private

      def validator_classes
        classes = []
        
        case @state
        when :valid then classes << "input-success"
        when :invalid then classes << "input-error"
        end

        merge_classes(*classes)
      end
    end
  end
end
