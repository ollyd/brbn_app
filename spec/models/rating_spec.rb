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

require 'spec_helper'

describe Rating do
    
    it { should belong_to :user }
    it { should belong_to :bourbon }

end
