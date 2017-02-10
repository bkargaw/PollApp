# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  choice_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Response < ActiveRecord::Base
  vaidate :respondent_already_answered?: false
  validates :user_id, :choice_id, presence: true

  def sibling_responses
    self.question.responses.where.not(self.id)
  end

  def not_duplicate_response
    sibling_responses.exists?(user_id: self.user_id)
  end

  def respondent_already_answered?
    not_duplicate_response
  end

  has_one :question,
    through: :choice,
    source: :question

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User


  belongs_to :choice,
    primary_key: :id,
    foreign_key: :choice_id,
    class_name: :Choice

end
