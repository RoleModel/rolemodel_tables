# frozen_string_literal: true

module RoleModelTables
  module Filters
    # Handle collection dropdowns.
    class CollectionFilter < RansackFilter
      def form_row(form)
        content_tag(:div, class: 'form__group') do
          [
            label(form),
            collection_select(form)
          ].join(' ').html_safe
        end
      end

      private

      def collection_select(form)
        form.collection_select(
          ransack_matcher,
          form_options.fetch(:collection, -> { [] }).call(filter),
          form_options.fetch(:option_value, ''),
          form_options.fetch(:option_label, ''),
          { include_blank: 'Any' },
          { class: 'form__dropdown' }
        )
      end
    end
  end
end
