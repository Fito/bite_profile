class DietExclusionsController < ApplicationController
  def create
    render json: record.to_json
  end

  def update
    render json: record.to_json
  end

  def record
    record = DietExclusion::Upserter.new(params).perform
    record.as_json
  end
end
