Rails.application.routes.draw do
  get '/users/me', to: 'cards#get_employee'
  post '/auth', to: 'auths#login'
  put '/users/password', to: 'auths#change_password'
  put '/users/accounts', to: 'auths#change_profile'
  post '/devices', to: 'devices#register_fcm_token'
  delete '/devices', to: 'devices#un_register_fcm_token'
  get '/notificationSettings', to: 'notifications#obtain_preferences'
  post '/notificationSettings', to: 'notifications#set_preferences'
  post '/heartcards/:id/verifications/ocr', to: 'cards#upload_picture'
  get '/licenses', to: 'cards#get_user_cards'
  post '/heartcards/:id/verifications/ecard', to: 'cards#upload_number'
  put '/ocrAsserts/:id', to: 'cards#add_renewal_date'
  get '/verifications/ecard/:card_id', to: 'cards#get_card_image'
  get '/accesscodes/:code/accounts', to: 'sign_up#get_account_details'
  get '/employees', to:'sign_up#get_employer_details'
  post '/accessCodes/:code', to: 'sign_up#create_account'
  post '/applications/wallet/accessCodes', to: 'sign_up#resend_code'
  post '/applications/wallet/passwordResetTokens', to: 'sign_up#reset_password'
  get '/users/workplaces', to:'workplaces#get_workplaces'
  post '/unmonitored/:id', to: 'unmonitored#upload_unmonitored'
  get '/applicants/:applicantId/requirements', to:'requirements#get_requirements'
  post '/applicants/:applicantId/requirements/:requirementId/automated', to: 'requirements#add_licenses_or_certification'
  post '/applicants/:applicantId/requirements/:requirementId/unmonitored', to: 'requirements#upload_picture'
  post '/applicants/:applicantId/requirements/:requirementId/ocr', to: 'requirements#upload_pictures'
  put '/applicants/:applicantId/requirements/:requirementId/unmonitored', to: 'requirements#upload_picture'
  put '/applicants/:applicantId/requirements/:requirementId/ocr', to: 'requirements#upload_pictures'
  post '/applicants/:applicantId/requirements/:requirementId/ecard', to: 'requirements#upload_ecard'
  post '/applicants/:applicantId/requirements/:requirementId/tbo', to: 'requirements#tbo'
  put '/applicants/:applicantId/requirements/submit', to: 'requirements#submit'
  get '/applicants/:applicantId/requirements/:requirementId/group', to: 'requirements#get_group_of_requirements'
end