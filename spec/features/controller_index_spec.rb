require 'spec_helper'

describe 'controller index' do
  context 'when a user requests a page' do
    it 'should respond with an ok status' do
      get '/'
      expect(last_response).to be_ok
    end
  end
end
