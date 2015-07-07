require 'csv'

module PGEnhanced
  class Client
    attr_reader :connection

    def self.establish_connection(options)
      new(connection.establish_connection(options))
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

    def execute_csv(query, options={})
      CSV.generate(options) do |csv|
        result = execute(query)
        csv << result.first.keys
        result.each do |row|
          csv << row.values
        end
      end
    end

    private

    def self.connection
      @connection ||= Connection.new
    end
    private_class_method :connection
  end
end
