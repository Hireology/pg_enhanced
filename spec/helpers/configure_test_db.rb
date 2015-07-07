require 'test_db_configuration'

module Helpers
  class ConfigureTestDB
    def self.execute!
      `dropdb #{TestDBConfiguration::DATABASE} --if-exists --username #{TestDBConfiguration::USERNAME}`
      `createdb --username #{TestDBConfiguration::USERNAME} #{TestDBConfiguration::DATABASE}`
      `psql -p #{TestDBConfiguration::PORT} -U #{TestDBConfiguration::USERNAME} #{TestDBConfiguration::DATABASE} -h #{TestDBConfiguration::HOST} -c "CREATE TABLE test_table (name VARCHAR(255))"`
      `psql -p #{TestDBConfiguration::PORT} -U #{TestDBConfiguration::USERNAME} #{TestDBConfiguration::DATABASE} -h #{TestDBConfiguration::HOST} -c "INSERT INTO test_table (name) VALUES ('Tyrion Lannister'), ('Jon Snow'), ('Eddard Stark'), ('Daenerys Targaryen')"`
    end
  end
end
