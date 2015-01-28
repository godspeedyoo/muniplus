require 'spec_helper'

describe 'controller stops' do
  context 'when the user requests a stop' do
    it 'should respond with an ok status' do
      expect(last_response).to be_ok
    end

    it 'should contain show information for that stop' do
      expect(last_response.body).to include("Stop Information")
    end
  end
end
