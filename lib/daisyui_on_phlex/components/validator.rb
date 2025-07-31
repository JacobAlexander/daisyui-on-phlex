# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Validator < DaisyuiOnPhlex::Base
      def initialize(
        valid: nil,
        invalid: nil,
        **attributes
      )
        @valid = valid
        @invalid = invalid
        @attributes = attributes
      end

      def view_template(&block)
        div(class: validator_classes, **@attributes, &block)
      end

      private

      def validator_classes
        classes = []
        
        if @valid == true
          classes << "input-success"
        elsif @valid == false || @invalid == true
          classes << "input-error"
        end

        merge_classes(*classes)
      end
    end
  end
end
