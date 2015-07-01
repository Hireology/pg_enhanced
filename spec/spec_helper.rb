$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH << File.join(File.dirname(__FILE__))
require 'dw'

HOST     = 'localhost'
PORT     = 5432
DATABASE = 'dw_test_db'
USERNAME = 'hireology'
PASSWORD = 'h1r3'
CONNECTION_OPTIONS = {
  :host => HOST,
  :port => PORT,
  :database => DATABASE,
  :username => USERNAME,
  :password => PASSWORD
}

RSpec.configure do |config|
  config.before(:suite) do
    `dropdb #{DATABASE} --if-exists --username #{USERNAME}`
    `createdb --username #{USERNAME} #{DATABASE}`
    `psql -p #{PORT} -U #{USERNAME} #{DATABASE} -h #{HOST} -c "CREATE TABLE test_table (name VARCHAR(255))"`
    `psql -p #{PORT} -U #{USERNAME} #{DATABASE} -h #{HOST} -c "INSERT INTO test_table (name) VALUES ('Tyrion Lannister'), ('Jon Snow'), ('Eddard Stark'), ('Daenerys Targaryen')"`
  end
end
