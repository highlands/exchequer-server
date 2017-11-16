desc 'Run stylelint'
task :stylelint do
  sh 'stylelint app/assets/**/*.scss --scss syntax' if ENV['RAILS_ENV'] != 'production'
end
