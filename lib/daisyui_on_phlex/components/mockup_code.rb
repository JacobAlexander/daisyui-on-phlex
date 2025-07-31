# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    module Mockup
      class Code < DaisyuiOnPhlex::Base
        def initialize(**attributes)
          @attributes = attributes
        end

        def view_template(&block)
          div(class: "mockup-code", **@attributes, &block)
        end

        def line(prefix: nil, **attributes, &block)
          pre(data: { prefix: prefix }, **attributes, &block)
        end
      end
    end
  end
end
