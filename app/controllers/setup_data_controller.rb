class SetupDataController < ApplicationController
  
   def setup
    render json: generate_response, status: :ok
  end
  
  def generate_response
    workplaces_json = File.read("#{Rails.root}/app/mocks/setupData.json")
    return workplaces_json
      end
end
