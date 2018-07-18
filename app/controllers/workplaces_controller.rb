class WorkplacesController < ApplicationController
  before_action :authenticate!, only: [:get_inbox_items]

  def get_workplaces
    render json: generate_workplaces_response, status: :ok
  end

  def generate_workplaces_response
    workplaces_json = File.read("#{Rails.root}/app/mocks/workplaces/workplaces.json")
    return workplaces_json
      end
end
