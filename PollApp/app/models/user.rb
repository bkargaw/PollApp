# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true


  has_many :responses,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Response

  has_many :authored_polls,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Poll



end
