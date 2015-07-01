require 'spec_helper'
require 'dw/connection'

module DW
  describe Connection do
    let(:host)     { "test" }
    let(:port)     { 5432 }
    let(:database) { "test_db" }
    let(:username) { "test user" }
    let(:password) { "test password" }

    let(:connection_options) do
      {
        :host => host,
        :port => port,
        :database => database,
        :username => username,
        :password => password
      }
    end

    it "creates a connection object with the correct params" do
      expect(::PG::Connection).to receive(:new).with(
        :host => connection_options[:host],
        :port => connection_options[:port],
        :dbname => connection_options[:database],
        :user => connection_options[:username],
        :password => connection_options[:password]
      )

      subject.establish_connection(connection_options)
    end
  end
end
