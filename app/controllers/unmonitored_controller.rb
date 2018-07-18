class UnmonitoredController < ApplicationController
  before_action :authenticate!, only: [:get_inbox_items]

  def upload_unmonitored
          sleep 3
          render json: {
            "imageUrl": "http://test.storages3.evercheck.com:3000/evercheck/62895c72-0c49-43ec-ab8b-0cd63acb7966",
                "id": 18,
                "completed": true,
                "certificantName": "Test 8",
                "certificateType": "",
                "issueDate": "",
                "verificationDate": "",
                "approved": "",
                "comment": "",
                "reviewedBy": "",
                "reviewedAt": "",
                "createdAt": "2018-05-31T19:41:13.000Z",
                "updatedAt": "2018-05-31T22:25:45.000Z",
                "unmonitoredLicenseId": 3
          }, status: :ok
  end

end
