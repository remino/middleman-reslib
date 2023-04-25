PROJECT_ROOT_PATH = File.dirname(File.dirname(File.dirname(__FILE__)))
require 'middleman-core'

# Error with step_definitions.rb, so only including what we really need for now:
# require 'middleman-core/step_definitions'
require 'aruba/cucumber'
require 'middleman-core/step_definitions/middleman_steps'
require 'middleman-core/step_definitions/builder_steps'
require 'middleman-core/step_definitions/server_steps'

require File.join(PROJECT_ROOT_PATH, 'lib', 'middleman-reslib', 'date')
require File.join(PROJECT_ROOT_PATH, 'lib', 'middleman-reslib', 'external_link_popup')
require File.join(PROJECT_ROOT_PATH, 'lib', 'middleman-reslib', 'i18n')
