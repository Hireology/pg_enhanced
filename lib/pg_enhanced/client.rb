module PGEnhanced
  class Client
    attr_reader :connection

    def self.configure(options)
      new(establish_connection(options))
    end

    def initialize(connection)
      @connection = connection
    end

    def execute(query)
      connection.exec(query)
    end

    def execute_json(query)
      connection.exec(
        "select array_to_json(array_agg(row_to_json(t)))
         from (
        #{query}
         ) t "
      ).first["array_to_json"]
    end

    private

    def self.connection
      @connection ||= Connection.new
    end
    private_class_method :connection

    def self.establish_connection(options)
      connection.establish_connection(options)
    end
    private_class_method :establish_connection
  end
end