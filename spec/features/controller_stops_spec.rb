require 'spec_helper'

describe 'controller stops' do
  let(:inbound_url) { "/inbound/24th%20St%20&%20Mission%20St" }
  let(:outbound_url) { "/outbound/Pacific%20Ave%20&%20Van%20Ness%20Ave" }

  context 'when the user requests an inbound stop' do
    it 'should respond with an ok status' do
      get inbound_url
      expect(last_response).to be_ok
    end

    it 'should contain information for that stop' do
      get inbound_url
      expect(last_response.body).to include("Stop Information")
    end

  end

  context 'when the user requests an outbound stop' do
    it 'should respond with an ok status' do
      get outbound_url
      expect(last_response).to be_ok
    end

    it 'should contain information for that stop' do
      get outbound_url
      expect(last_response.body).to include("Stop Information")
    end
  end
end
