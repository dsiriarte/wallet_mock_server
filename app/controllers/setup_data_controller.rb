class SetupDataController < ApplicationController
  
   def setup
    render json: generate_response, status: :ok
  end
  
  def generate_response
    return File.read("#{Rails.root}/app/mocks/setupData.json")
      end
end
