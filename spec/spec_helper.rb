$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH << File.join(File.dirname(__FILE__), 'helpers')
$LOAD_PATH << File.join(File.dirname(__FILE__))
require 'pg_enhanced'
require 'configure_test_db'

RSpec.configure do |config|
  config.before(:suite) do
    Helpers::ConfigureTestDB.execute!
  end
end
