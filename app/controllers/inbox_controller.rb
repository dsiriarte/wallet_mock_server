class InboxController < ApplicationController
  before_action :authenticate!, only: [:get_inbox_items]

  def get_tasks_items
    render json: generate_tasks_response(current_user), status: :ok
  end

  def generate_tasks_response(username)
    inbox_json = File.read("#{Rails.root}/app/mocks/inbox/messages.json")
    return inbox_json
  end
end
