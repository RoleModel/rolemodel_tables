# frozen_string_literal: true

module RoleModelTables
  module Filters
    # Handles a single date field filter.
    class DateFilter < RansackFilter
      def form_row(form)
        content_tag(:div, class: 'form__group') do
          [
            label(form),
            date_field(form)
          ].join(' ').html_safe
        end
      end

      private

      def date_field(form)
        form.date_field(ransack_matcher, { class: 'form__input' })
      end
    end
  end
end
