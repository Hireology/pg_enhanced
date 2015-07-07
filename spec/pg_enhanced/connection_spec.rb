require 'spec_helper'

module PGEnhanced
  describe Connection do
    it "creates a connection object with the correct params" do
      expect(::PG::Connection).to receive(:new).with(
        :host => Helpers::TestDBConfiguration::HOST,
        :port => Helpers::TestDBConfiguration::PORT,
        :dbname => Helpers::TestDBConfiguration::DATABASE,
        :user => Helpers::TestDBConfiguration::USERNAME,
        :password => Helpers::TestDBConfiguration::PASSWORD
      )

      subject.establish_connection(Helpers::TestDBConfiguration::CONNECTION_OPTIONS)
    end
  end
end
