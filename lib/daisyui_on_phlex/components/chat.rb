# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Chat < DaisyuiOnPhlex::Base
      def initialize(position: :start, **attributes)
        @position = position
        @attributes = attributes
      end

      def view_template(&block)
        div(class: chat_classes, **@attributes, &block)
      end

      def image(src:, alt: "", **attributes)
        div(class: "chat-image avatar") do
          div(class: "w-10 rounded-full") do
            img(src: src, alt: alt, **attributes)
          end
        end
      end

      def header(time: nil, **attributes, &block)
        div(class: merge_classes("chat-header", attributes[:class]), **attributes.except(:class)) do
          yield if block_given?
          if time
            time_tag(time, class: "text-xs opacity-50") { time }
          end
        end
      end

      def bubble(**attributes, &block)
        div(class: merge_classes("chat-bubble", attributes[:class]), **attributes.except(:class), &block)
      end

      def footer(**attributes, &block)
        div(class: merge_classes("chat-footer", "opacity-50", attributes[:class]), **attributes.except(:class), &block)
      end

      private

      def chat_classes
        classes = ["chat"]
        
        case @position
        when :start then classes << "chat-start"
        when :end then classes << "chat-end"
        end

        merge_classes(*classes)
      end
    end
  end
end
