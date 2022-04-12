# frozen_string_literal: true

module RoleModelTables
  module Filters
    # Parent class for all custom filters.
    class RansackFilter
      include ActionView::Context
      include ActionView::Helpers::TagHelper

      attr_reader :ransack_matcher, :form_options
      attr_accessor :filter

      def initialize(ransack_matcher, form_options = {})
        @ransack_matcher = ransack_matcher
        @form_options = form_options
      end

      def form_row(_form)
        throw 'Subclass must override'
      end

      private

      def label(form)
        form.label(
          ransack_matcher,
          form_options.fetch(:label, ransack_matcher.to_s.humanize),
          class: 'form__label'
        )
      end
    end
  end
end
