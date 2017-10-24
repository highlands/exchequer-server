require 'simplecov-json'

SimpleCov.use_merging true

# FIXME: This coverage will need to be higher, but not sure how to make it work
# with the default rake task yet
SimpleCov.minimum_coverage 1

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::JSONFormatter
]

SimpleCov.start 'rails' do
  # Filters
  add_filter 'lib/assets' # Don't count assets
  add_filter 'lib/tasks' # Don't count rake tasks
  add_filter 'app/admin'

  # Groups
  add_group 'Controllers', 'app/controllers'
  add_group 'Helpers', 'app/helpers'
  add_group 'Jobs', 'app/jobs'
  add_group 'Libraries', 'lib'
  add_group 'Mailers', 'app/mailers'
  add_group 'Policies', 'app/policies'

  merge_timeout 3600
end
