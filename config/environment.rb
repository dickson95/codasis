# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
Date::DATE_FORMATS[:default] = "%d de %B de %Y"
Time::DATE_FORMATS[:default] = "%H:%M"
