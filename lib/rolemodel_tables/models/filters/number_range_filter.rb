# frozen_string_literal: true

module RoleModelTables
  module Filters
    # Handles a number range filter.
    class NumberRangeFilter < RansackFilter
      def form_row(form)
        content_tag(:div, class: 'form__group') do
          [
            label(form),
            content_tag(:div, class: 'flex items-center gap-sm') do
              [
                search_field(form, :gteq),
                content_tag(:span, '-'),
                search_field(form, :lteq)
              ].join(' ').html_safe
            end
          ].join(' ').html_safe
        end
      end

      private

      def search_field(form, predicate)
        form.search_field(
          "#{ransack_matcher}_#{predicate}",
          class: 'form__input',
          placeholder: form_options.fetch(:range_begin_placeholder, '')
        )
      end
    end
  end
end
