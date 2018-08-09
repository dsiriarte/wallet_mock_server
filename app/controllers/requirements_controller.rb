class RequirementsController < ApplicationController
  before_action :authenticate!, only: [:get_inbox_items]

  def get_requirements
    render json: generate_requirements_response, status: :ok
  end

  def generate_requirements_response
    workplaces_json = File.read("#{Rails.root}/app/mocks/requirements/requirements.json")
    return workplaces_json
  end

  def upload_picture
    render json: {
      imageUrl: nil,
      id: 11,
      type: "ocr",
      verificationDate: "2016-09-01T13:28:38.530Z",
      heartcardId: 3,
      completed: false,
      attempts: 1,
      assert: {
        imageUrl: "http://test.storage.cebroker.com/evercheck/6ee55caf-df03-4a7e-b6c6-a8fe837453ef",
        completed: false,
        id: 10,
        imageToken: "6ee55caf-df03-4a7e-b6c6-a8fe837453ef",
        ocrProcessId: "b8f10150-7047-11e6-bd2a-87524530572f",
        heartcardVerificationId: 11
      }
    }, status: :ok
  end

  def add_licenses_or_certification
    render json: {
	  	status: "SuccessSubmission",
		message: "The submission was received, a notification will be sent when it's completed"
    }, status: :ok
  end

end
