# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Filter < DaisyuiOnPhlex::Base
      def initialize(name:, **attributes)
        @name = name
        @attributes = attributes
      end

      def view_template(&block)
        div(class: "filter", **@attributes, &block)
      end

      def option(value:, label:, checked: false, **attributes)
        div(class: "filter-option") do
          input(
            type: "radio",
            name: @name,
            value: value,
            id: "#{@name}_#{value}",
            checked: checked,
            class: "filter-radio sr-only",
            **attributes
          )
          label(
            for: "#{@name}_#{value}",
            class: "filter-label cursor-pointer"
          ) { label }
        end
      end
    end
  end
end
