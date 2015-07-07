require 'spec_helper'

RSpec.describe PGEnhanced::Client do
  subject { described_class }

  let(:client) { subject.establish_connection(Helpers::TestDBConfiguration::CONNECTION_OPTIONS) }

  describe "configuration" do
    it "returns a client object" do
      expect(client).to be_a(PGEnhanced::Client)
    end
  end

  context "querying" do
    describe "#execute" do
      it "can execute arbitrary queries whose results are in postgres result object format" do
        query = "select count(*) from test_table"

        result = client.execute(query)

        expect(result.first["count"]).to eq("4")
      end
    end

    describe "#execute_json" do
      it "can execute arbitrary queries whose results are a json array of json objects" do
        query = "select * from test_table"

        result = client.execute_json(query)

        expect(result).to eq("[{\"name\":\"Tyrion Lannister\"},{\"name\":\"Jon Snow\"},{\"name\":\"Eddard Stark\"},{\"name\":\"Daenerys Targaryen\"}]")
      end
    end
  end
end
