# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Kbd < DaisyuiOnPhlex::Base
      def initialize(size: :md, **attributes)
        @size = size
        @attributes = attributes
      end

      def view_template(&block)
        size_class = case @size
        when :xs then "kbd-xs"
        when :sm then "kbd-sm"
        when :md then "kbd-md"
        when :lg then "kbd-lg"
        end

        kbd(
          class: merge_classes("kbd", size_class, @attributes[:class]),
          **@attributes.except(:class),
          &block
        )
      end
    end
  end
end
