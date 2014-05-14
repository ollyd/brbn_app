# == Schema Information
#
# Table name: bourbons
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  alcohol      :integer
#  image        :text
#  description  :text
#  toffee       :integer
#  woody        :integer
#  tannic       :integer
#  char         :integer
#  sweet        :integer
#  grainy       :integer
#  vanilla      :integer
#  corny        :integer
#  buttery      :integer
#  heat         :integer
#  dark_fruit   :integer
#  citrus_fruit :integer
#  floral       :integer
#  spicy        :integer
#  herbal       :integer
#  malty        :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Bourbon < ActiveRecord::Base
    attr_accessible :name, :alcohol, :image, :description, :toffee, :woody, :tannic, :char, :sweet, :grainy, :vanilla, :corny, :buttery,
    :heat, :dark_fruit, :citrus_fruit, :floral, :spicy, :herbal, :malty

    has_many :ratings
end
