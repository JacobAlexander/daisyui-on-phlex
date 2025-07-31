# frozen_string_literal: true

require "phlex"
require "tailwind_merge"

module DaisyuiOnPhlex
  class Base < Phlex::HTML
    private

    def merge_classes(*classes)
      TailwindMerge::Merger.new.merge(classes.compact.join(" "))
    end
  end
end
