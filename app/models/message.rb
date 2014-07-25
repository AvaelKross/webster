# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  text         :text
#  project_id   :integer
#  message_type :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  status       :boolean          default(FALSE)
#

class Message < ActiveRecord::Base
  belongs_to :project

  after_create :send_message

  protected

    def send_message
      
    end
end
