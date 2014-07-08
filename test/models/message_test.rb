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
#

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
