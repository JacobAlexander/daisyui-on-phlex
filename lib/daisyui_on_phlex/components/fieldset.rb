# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Fieldset < DaisyuiOnPhlex::Base
      def initialize(**attributes)
        @attributes = attributes
      end

      def view_template(&block)
        fieldset(class: "fieldset", **@attributes, &block)
      end

      def legend(**attributes, &block)
        legend(class: "fieldset-legend", **attributes, &block)
      end

      def label(text = nil, **attributes, &block)
        label_tag(class: "fieldset-label", **attributes) do
          text ? text : yield
        end
      end

      private

      def label_tag(...)
        label(...)
      end
    end
  end
end
