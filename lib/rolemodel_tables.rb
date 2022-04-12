# frozen_string_literal: true

module RoleModelTables
  class Error < StandardError; end
end

require 'rolemodel_tables/engine'
require 'rolemodel_tables/models/filter_view'
require 'rolemodel_tables/models/ransack_filter'

Dir.chdir(__dir__) do
  Dir['rolemodel_tables/models/filters/*.rb'].each { |file| require file }
end
