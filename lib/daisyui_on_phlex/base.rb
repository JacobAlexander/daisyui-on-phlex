# frozen_string_literal: true

require "phlex"

module DaisyuiOnPhlex
  class Base < Phlex::HTML
    private

    def merge_classes(*classes)
      classes.compact.join(" ")
    end

    def data_attributes(data = {})
      data.transform_keys { |key| "data-#{key.to_s.tr('_', '-')}" }
    end
  end
end
