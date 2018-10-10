class StatesController < ApplicationController
  before_action :authenticate!, only: [:get_inbox_items]

  def get_states
    render json: generate_states_response, status: :ok
  end

  def generate_states_response
    workplaces_json = File.read("#{Rails.root}/app/mocks/states/states.json")
    return workplaces_json
      end
end