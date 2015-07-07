module Helpers
  class TestDBConfiguration
    HOST     = 'localhost'
    PORT     = 5432
    DATABASE = 'pg_enhanced'
    USERNAME = 'pg_enhanced'
    PASSWORD = ''

    CONNECTION_OPTIONS = {
      "host" => HOST,
      "port" => PORT,
      "database" => DATABASE,
      "username" => USERNAME,
      "password" => PASSWORD
    }
  end
end
