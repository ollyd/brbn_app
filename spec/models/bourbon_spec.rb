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

require 'spec_helper'

describe Bourbon do
    
    it { should have_many :ratings }

    before do 
        @bourbon = Bourbon.new
    end

    it 'should return a new Bourbon' do  
        @bourbon.should_not be_nil
        @bourbon.class.should eq(Bourbon)
    end

    it 'should have a name attribute' do
        @bourbon.should respond_to(:name) # @bourbon.name
    end

    it 'should have a description attribute' do
        @bourbon.should respond_to(:description) # @bourbon.description
    end

    it 'should have a image attribute' do
        @bourbon.should respond_to(:image) # @bourbon.image
    end

    it 'should have a alcohol attribute' do
        @bourbon.should respond_to(:alcohol) # @bourbon.alcohol
    end
end

