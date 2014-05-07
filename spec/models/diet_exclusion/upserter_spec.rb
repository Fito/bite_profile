require 'spec_helper'

describe DietExclusion::Upserter do
  let(:upserter) { DietExclusion::Upserter.new(params) }
  let(:params) {
    { user_id: '12', exclusions: ['Sugar', 'Gluten'] }
  }

  describe '#perform' do
    context 'diet exclusions in params dont exist' do
      it 'creates diet exclusion records for the user id' do
        expect { upserter.perform }.to change { DietExclusion.count }.by 2
      end
    end

    context 'diet exclusions in params already exist' do
      before do
        params[:exclusions].each do |ex|
          DietExclusion.create(type: ex, user_id: params[:user_id])
        end
      end

      it 'does not create new records for the user id' do
        expect { upserter.perform }.to change { DietExclusion.count }.by 0
      end
    end

    context 'some diet exclusions already exist and some dont' do
      let(:existing_type) { 'Sugar' }
      let(:new_type) { 'Gluten' }

      before do
        DietExclusion.create(type: existing_type, user_id: params[:user_id])
      end

      it 'does not create new records for the already existing' do
        upserter.perform
        DietExclusion.where(type: existing_type, user_id: params[:user_id]).count.should == 1
      end

      it 'creates diet exclusion records for the ones that dont exist' do
        expect { upserter.perform }.to change { DietExclusion.count }.by 1
        DietExclusion.where(user_id: params[:user_id]).last.type.should == new_type
      end
    end

    context 'missing diet exclusions from params' do
      let(:type_to_delete) { 'Seafood' }
      before do
        DietExclusion.create(type: type_to_delete, user_id: params[:user_id])
      end

      it 'deletes the diet exclusion records not present in params' do
        upserter.perform
        DietExclusion.where(user_id: params[:user_id], type: type_to_delete).count.should == 0
      end
    end
  end
end
