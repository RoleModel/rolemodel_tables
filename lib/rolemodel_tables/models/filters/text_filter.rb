# frozen_string_literal: true

module RoleModelTables
  module Filters
    # Handles a text field filter.
    class TextFilter < RansackFilter
      def form_row(form)
        content_tag(:div, class: 'form__group') do
          [
            label(form),
            search_field(form)
          ].join(' ').html_safe
        end
      end

      private

      def search_field(form)
        form.search_field(
          ransack_matcher,
          class: 'form__input',
          placeholder: form_options.fetch(:placeholder, '')
        )
      end
    end
  end
end
