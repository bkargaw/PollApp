# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  poll_id    :integer          not null
#  body       :text             not null
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  validates :body, :poll_id, presence: true

  has_many :responses,
    through: :choices,
    source: :responses


  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :Choice

end
