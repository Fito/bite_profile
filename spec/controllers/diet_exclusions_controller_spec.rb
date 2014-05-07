require 'spec_helper'

describe DietExclusionsController do
  let(:params) {
    { exclusions: ["Sugar"], user_id: "1" }
  }

  describe '#create' do
    it 'delegates to the upserter' do
      upserter = double('upserter')
      DietExclusion::Upserter.should_receive(:new).and_return(upserter)
      upserter.should_receive(:perform)

      post :create, params, format: :json
    end

    it 'responds with json' do
      post :create, params, format: :json
      response.header['Content-Type'].should include('json')
    end
  end

  describe '#update' do
    it 'delegates to the upserter' do
      upserter = double('upserter')
      DietExclusion::Upserter.should_receive(:new).and_return(upserter)
      upserter.should_receive(:perform)

      put :update, params, format: :json
    end

    it 'responds with json' do
      put :update, params, format: :json
      response.header['Content-Type'].should include('json')
    end
  end
end
