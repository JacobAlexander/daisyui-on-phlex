# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Countdown < DaisyuiOnPhlex::Base
      def initialize(value:, **attributes)
        @value = value
        @attributes = attributes
      end

      def view_template
        span(
          class: "countdown font-mono text-2xl",
          style: "--value: #{@value};",
          **@attributes
        )
      end
    end
  end
end
