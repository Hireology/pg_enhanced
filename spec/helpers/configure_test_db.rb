require 'test_db_configuration'

module Helpers
  class ConfigureTestDB
    def self.execute!
      `dropdb #{TestDBConfiguration::DATABASE} --if-exists --username #{TestDBConfiguration::USERNAME}`
      `createdb --username #{TestDBConfiguration::USERNAME} #{TestDBConfiguration::DATABASE}`
      `psql -p #{TestDBConfiguration::PORT} -U #{TestDBConfiguration::USERNAME} #{TestDBConfiguration::DATABASE} -h #{TestDBConfiguration::HOST} -c "CREATE TABLE test_table (name VARCHAR(255), age INTEGER)"`
      `psql -p #{TestDBConfiguration::PORT} -U #{TestDBConfiguration::USERNAME} #{TestDBConfiguration::DATABASE} -h #{TestDBConfiguration::HOST} -c "INSERT INTO test_table (name, age) VALUES ('Tyrion Lannister', 23), ('Jon Snow', 18), ('Eddard Stark', 40), ('Daenerys Targaryen', 18)"`
    end
  end
end
