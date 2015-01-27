require 'spec_helper'

describe 'controller index' do
  context 'when a user requests a page' do
    it 'should respond with an ok status' do
      get '/'
      expect(last_response).to be_ok
    end

    it 'should contain a form to enter your route' do
      get '/'
      expect(last_response.body).to include("Welcome")
    end
  end
end
