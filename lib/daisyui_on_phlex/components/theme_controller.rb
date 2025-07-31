# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class ThemeController < DaisyuiOnPhlex::Base
      def initialize(
        type: :checkbox,
        value: nil,
        name: "theme-dropdown",
        **attributes
      )
        @type = type
        @value = value
        @name = name
        @attributes = attributes
      end

      def view_template
        input(
          type: @type.to_s,
          class: "theme-controller",
          name: @name,
          value: @value,
          **@attributes
        )
      end
    end
  end
end
