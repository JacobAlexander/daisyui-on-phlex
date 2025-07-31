# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    module Mockup
      class Phone < DaisyuiOnPhlex::Base
        def initialize(**attributes)
          @attributes = attributes
        end

        def view_template(&block)
          div(class: "mockup-phone", **@attributes, &block)
        end

        def camera
          div(class: "camera")
        end

        def display(**attributes, &block)
          div(class: "display", **attributes, &block)
        end

        def artboard(**attributes, &block)
          div(class: "artboard artboard-demo phone-1", **attributes, &block)
        end
      end
    end
  end
end
