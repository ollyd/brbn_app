# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  score      :integer          default(0)
#  bourbon_id :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Rating < ActiveRecord::Base
    attr_accessible :score, :bourbon_id, :user_id
    
    belongs_to :user
    belongs_to :bourbon

    # def average_rating
    #     ratings.sum(:score) / ratings.size
    # end
end
