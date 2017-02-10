# == Schema Information
#
# Table name: choices
#
#  id            :integer          not null, primary key
#  question_id   :integer          not null
#  answer_choice :text             not null
#  created_at    :datetime
#  updated_at    :datetime
#

class Choice < ActiveRecord::Base
  validates :question_id, :answer_choice, presence: true

  has_many :responses,
  primary_key: :id,
  foreign_key: :choice_id,
  class_name: :Response

  belongs_to :question,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :Question

end
