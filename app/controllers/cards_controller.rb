class CardsController < ApplicationController
  before_action :authenticate!, only: [:get_user_cards, :get_employee]
  def get_user_cards
    if current_user == 'applicant_user'
        render json: insufficient_permission_response, status: :forbidden
    else
        render json: generate_card_response(current_user), status: :ok
    end
  end

  def get_employee
    render json: generate_employee_response(current_user), status: :ok
  end

  # TODO: Implement different flows and not always success.
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

# TODO: Implement different flows and not always success.
  def add_renewal_date
    render json: {
      imageUrl: "http://test.storage.cebroker.com/evercheck/436ef7dc-5fb3-4318-9ae5-c886add62070",
      id: 23,
      type: "ocr",
      selectedImageToken: "436ef7dc-5fb3-4318-9ae5-c886add62070",
      completed: true,
      certificantName: "Brock Wallace",
      certificateType: "HealthcareProvider",
      issueDate: "2420-07-31T00:00:00.000Z",
      renewalDate: "2017-07-31T00:00:00.000Z",
      verificationDate: "2016-09-05T15:03:15.198Z",
      attempts: 1,
      heartcardId: 7
    }, status: :ok
  end

  def get_card_image
    if valid_ecard_numbers.include? params[:card_id]
      response = {
        number: "142004612172",
        certificantName: "Jody Speight",
        certificateType: "BLS for Healthcare",
        issueDate: "2014-12-01T00:00:00.000Z",
        renewalDate: "2016-12-31T00:00:00.000Z",
        imageUrl: "http://api.test.wallet.evercheck.com/verifications/screenshots/142004612172-20160920144812.png"
      }
      render json: parse_image_urls(response.stringify_keys), status: :ok
    else
      render json: card_not_found_response, status: :not_found
    end
  end

  def upload_number
    if valid_ecard_numbers.include? params[:number]
      sleep 3
      render json: {
        imageUrl: "http://test.storage.cebroker.com/evercheck/94f26eeb-ba17-4685-8c64-05de95e3014a",
        canAttempt: true,
        type: "ecard",
        verificationDate: "2016-09-20T19:27:41.064Z",
        heartcardId: 123,
        certificantName: "Jody Speight",
        certificateType: "BLS for Healthcare",
        issueDate: "2014-12-01T00:00:00.000Z",
        renewalDate: "2016-12-31T00:00:00.000Z",
        completed: true,
        attempts: 1
      }, status: :ok
    else
      render json: card_not_found_response, status: :not_found
    end
  end

  private

  def generate_card_response(username)
    cards_json = File.read("#{Rails.root}/app/mocks/cards/#{username}.json")
    return cards_json
  end

  def generate_employee_response(username)
    cards_json = File.read("#{Rails.root}/app/mocks/employees/#{username}.json")
    hash = JSON.parse(cards_json)
    return hash if hash[:heartcards.to_s].nil?
    hash[:heartcards.to_s].each do |item|
      parse_image_urls(item)
    end
    hash
  end

  def parse_image_urls(item)
    unless item[:imageUrl.to_s].empty?
      item[:imageUrl.to_s] = "#{request.base_url}/images/heart_card.jpg"
    end
    item
  end

  def card_not_found_response
    {
      statusCode: 404,
      error: "Not Found",
      message: "Ecard number not found",
      number: params[:card_id]
    }
  end

  def insufficient_permission_response
    {
      statusCode: 403,
      error: "Forbidden",
      message: "Insufficient scope"
    }
  end
end
