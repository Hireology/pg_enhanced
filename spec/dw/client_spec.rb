require 'spec_helper'

module DW
  describe Client do
    subject { described_class }

    describe "configuration" do
      it "returns a client object" do
        client = subject.configure(CONNECTION_OPTIONS)
        expect(client).to be_a(DW::Client)
      end
    end

    context "querying" do
      let(:client) { subject.configure(CONNECTION_OPTIONS) }

      describe "#execute" do
        it "can execute arbitrary queries whose results are in postgres result object format" do
          query = "select count(*) from test_table"

          result = client.execute(query)

          expect(result.first["count"]).to eq("4")
        end
      end

      describe "#execute_json" do
        it "can execute arbitrary queries whose results are in json format" do
          query = "select * from test_table"

          result = client.execute_json(query)

          expect(result).to eq(["{\"name\":\"Tyrion Lannister\"}", "{\"name\":\"Jon Snow\"}", "{\"name\":\"Eddard Stark\"}", "{\"name\":\"Daenerys Targaryen\"}"])
        end
      end
    end
  end
end
