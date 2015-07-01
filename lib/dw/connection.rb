require 'pg'

module DW
  class Connection
    def initialize
      @db_connection = nil
    end

    def establish_connection(options)
      @db_connection ||= PG::Connection.new(
        :host => options.fetch(:host, nil),
        :port => options.fetch(:port, nil),
        :dbname => options.fetch(:database, nil),
        :user => options.fetch(:username, nil),
        :password => options.fetch(:password, nil)
      )
    end
  end
end
