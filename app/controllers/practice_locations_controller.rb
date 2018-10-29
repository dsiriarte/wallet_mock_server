class PracticeLocationsController < ApplicationController
  before_action :authenticate!, only: [:get_inbox_items]

  def get_practice_locations
    render json: generate_practice_locations_response, status: :ok
  end

  def generate_practice_locations_response
    workplaces_json = File.read("#{Rails.root}/app/mocks/provider/providerPracticeLocations.json")
    return workplaces_json
      end
end
