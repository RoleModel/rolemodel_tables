# frozen_string_literal: true

module RoleModelTables
  module Filters
    # Handles a date range filter.
    class DateRangeFilter < RansackFilter
      def form_row(form)
        content_tag(:div, class: 'form__group') do
          [
            label(form),
            content_tag(:div, class: 'flex items-center gap-sm') do
              [
                date_field(form, :gteq),
                content_tag(:span, '-'),
                date_field(form, :lteq)
              ].join(' ').html_safe
            end
          ].join(' ').html_safe
        end
      end

      private

      def date_field(form, predicate)
        form.date_field("#{ransack_matcher}_#{predicate}", { class: 'form__input' })
      end
    end
  end
end
