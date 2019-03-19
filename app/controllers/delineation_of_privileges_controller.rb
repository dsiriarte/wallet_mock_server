class DelineationOfPrivilegesController < ApplicationController
    before_action :authenticate!, only: [:get_inbox_items]
    
    def get_privileges
     render json: generate_response, status: :ok
   end
   
   def generate_response
     return File.read("#{Rails.root}/app/mocks/provider/providerDelineationOfPrivileges.json")
       end
 end
 