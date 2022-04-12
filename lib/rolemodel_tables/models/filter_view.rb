# frozen_string_literal: true

module RoleModelTables
  # Parent class for all filter views.
  class FilterView
    class_attribute :default_sort, :quick_search, :advanced_filters
    attr_reader :ransack

    def initialize(scoped_collection)
      @scoped_collection = scoped_collection
    end

    def self.default_sort(sort_option)
      self.default_sort = sort_option
    end

    def self.quick_search(ransack_matcher)
      self.quick_search = ransack_matcher
    end

    def self.advanced_filter(ransack_matcher, klass_name, form_options = {})
      self.advanced_filters ||= {}
      self.advanced_filters[ransack_matcher] = "RoleModelTables::Filters::#{klass_name}".constantize.new(ransack_matcher, form_options)
    end

    def advanced_filters
      self.class.advanced_filters.map do |_, filter_instance|
        filter_instance.filter = self
        filter_instance
      end
    end

    def search(params)
      @ransack = @scoped_collection.ransack(params[:query])
      @ransack.sorts = default_sort if @ransack.sorts.empty?
      @ransack.result.page(params[:page])
    end
  end
end
