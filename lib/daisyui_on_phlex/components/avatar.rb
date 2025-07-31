# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Avatar < DaisyuiOnPhlex::Base
      def initialize(size: :md, shape: :circle, online: nil, placeholder: false, **attributes)
        @size = size
        @shape = shape
        @online = online
        @placeholder = placeholder
        @attributes = attributes
      end

      def view_template(&block)
        div(class: avatar_classes, **@attributes) do
          if @online
            div(class: status_classes)
          end
          
          if @placeholder
            div(class: placeholder_classes, &block)
          else
            div(class: image_classes, &block)
          end
        end
      end

      # Helper method that adds styling for initials
      def initials(text, **attributes)
        span(class: merge_classes("text-3xl", attributes[:class]), **attributes.except(:class)) { text }
      end

      private

      def avatar_classes
        classes = ["avatar"]
        classes << "placeholder" if @placeholder
        classes << "online" if @online == true
        classes << "offline" if @online == false
        merge_classes(*classes)
      end

      def image_classes
        classes = ["w-24", "rounded-full"]
        
        case @size
        when :xs then classes = ["w-6", "rounded-full"]
        when :sm then classes = ["w-8", "rounded-full"]
        when :md then classes = ["w-12", "rounded-full"]
        when :lg then classes = ["w-16", "rounded-full"]
        when :xl then classes = ["w-20", "rounded-full"]
        when :"2xl" then classes = ["w-24", "rounded-full"]
        end

        case @shape
        when :square then classes[-1] = "rounded"
        when :circle then # default rounded-full
        end

        merge_classes(*classes)
      end

      def placeholder_classes
        classes = ["bg-neutral", "text-neutral-content", "rounded-full", "w-24"]
        
        case @size
        when :xs then classes[-1] = "w-6"
        when :sm then classes[-1] = "w-8"
        when :md then classes[-1] = "w-12"
        when :lg then classes[-1] = "w-16"
        when :xl then classes[-1] = "w-20"
        when :"2xl" then classes[-1] = "w-24"
        end

        case @shape
        when :square then classes[2] = "rounded"
        when :circle then # default rounded-full
        end

        merge_classes(*classes)
      end

      def status_classes
        classes = ["absolute", "top-0", "right-0", "w-3", "h-3", "border-2", "border-white", "rounded-full"]
        classes << (@online ? "bg-green-400" : "bg-gray-400")
        merge_classes(*classes)
      end
    end
  end
end
