require 'spec_helper'

module DW
  describe Connection do
    it "creates a connection object with the correct params" do
      expect(::PG::Connection).to receive(:new).with(
        :host => HOST,
        :port => PORT,
        :dbname => DATABASE,
        :user => USERNAME,
        :password => PASSWORD
      )

      subject.establish_connection(CONNECTION_OPTIONS)
    end
  end
end
