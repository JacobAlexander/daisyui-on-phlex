# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Accordion < DaisyuiOnPhlex::Base
      def initialize(collapse: false, **attributes)
        @collapse = collapse
        @attributes = attributes
      end

      def view_template(&block)
        div(
          class: merge_classes("join", "join-vertical", "w-full", @attributes[:class]),
          **@attributes.except(:class),
          &block
        )
      end

      def item(expanded: false, **attributes, &block)
        div(class: merge_classes("collapse", ("collapse-open" if expanded)), **attributes) do
          yield AccordionItem.new if block_given?
        end
      end

      private

      class AccordionItem < DaisyuiOnPhlex::Base

        def title(**attributes, &block)
          div(class: "collapse-title text-xl font-medium", **attributes, &block)
        end

        def content(**attributes, &block)
          div(class: "collapse-content", **attributes, &block)
        end

        def checkbox(name:, **attributes)
          input(
            type: "checkbox",
            name: name,
            class: "collapse-checkbox",
            **attributes
          )
        end

        def radio(name:, value:, **attributes)
          input(
            type: "radio",
            name: name,
            value: value,
            class: "collapse-radio",
            **attributes
          )
        end
      end
    end
  end
end
