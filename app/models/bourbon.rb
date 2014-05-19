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

    attr_accessor :similar_id, :similarity, :similar

    has_many :ratings

    def find_similar
        bourbons = Bourbon.all.where('id != ?', self.id)
        results = {}
        # loop through and compare each bourbon
        bourbons.each do |bourbon|
            score = Bourbon.compare(self, bourbon)
            # store each bourbon ID in the hash with score as the key
            results[score] = bourbon.id
            results[bourbon.id] = bourbon.name
        end
        self.similarity = results.keys.max.to_i
        self.similar_id = results[results.keys.max]
    end

    #### SIMILARITY ALGORITHM ####

    def self.compare(bourbon1, bourbon2)
        # Subract one attribute value from the other to find the dif and use .abs to make number positive if needed
        toffee_var = (bourbon1.toffee.to_f - bourbon2.toffee.to_f).abs
        woody_var = (bourbon1.woody.to_f - bourbon2.woody.to_f).abs
        tannic_var = (bourbon1.tannic.to_f - bourbon2.tannic.to_f).abs
        char_var = (bourbon1.char.to_f - bourbon2.char.to_f).abs
        sweet_var = (bourbon1.sweet.to_f - bourbon2.sweet.to_f).abs
        grainy_var = (bourbon1.grainy.to_f - bourbon2.grainy.to_f).abs
        vanilla_var = (bourbon1.vanilla.to_f - bourbon2.vanilla.to_f).abs
        corny_var = (bourbon1.corny.to_f - bourbon2.corny.to_f).abs
        buttery_var = (bourbon1.buttery.to_f - bourbon2.buttery.to_f).abs
        heat_var = (bourbon1.heat.to_f - bourbon2.heat.to_f).abs
        dark_fruit_var = (bourbon1.dark_fruit.to_f - bourbon2.dark_fruit.to_f).abs
        citrus_fruit_var = (bourbon1.citrus_fruit.to_f - bourbon2.citrus_fruit.to_f).abs
        floral_var = (bourbon1.floral.to_f - bourbon2.floral.to_f).abs
        spicy_var = (bourbon1.spicy.to_f - bourbon2.spicy.to_f).abs
        herbal_var = (bourbon1.herbal.to_f - bourbon2.herbal.to_f).abs
        malty_var = (bourbon1.malty.to_f - bourbon2.malty.to_f).abs
       
        # Divide the dif by the larger value of bourbon1/2 to get the % difference, unless the dif is zero in which case add 100 
        if toffee_var == 0.0
            toffee_similarity = toffee_var + 100
        elsif (toffee_var != 0.0) && (bourbon1.toffee >= bourbon2.toffee)
            toffee_percentage_dif = toffee_var / bourbon1.toffee.to_f * 100
            toffee_similarity = 100 - toffee_percentage_dif
        else (toffee_var != 0.0) && (bourbon1.toffee < bourbon2.toffee)
            toffee_percentage_dif = toffee_var / bourbon2.toffee.to_f * 100
            toffee_similarity = 100 - toffee_percentage_dif
        end
            
        if woody_var == 0.0
            woody_similarity = woody_var + 100
        elsif (woody_var != 0.0) && (bourbon1.woody >= bourbon2.woody)
            woody_percentage_dif = woody_var / bourbon1.woody.to_f * 100
            woody_similarity = 100 - woody_percentage_dif
        else (woody_var != 0.0) && (bourbon1.woody < bourbon2.woody)
            woody_percentage_dif = woody_var / bourbon2.woody.to_f * 100
            woody_similarity = 100 - woody_percentage_dif
        end

        if tannic_var == 0.0
            tannic_similarity = tannic_var + 100
        elsif (tannic_var != 0.0) && (bourbon1.tannic >= bourbon2.tannic)
            tannic_percentage_dif = tannic_var / bourbon1.tannic.to_f * 100
            tannic_similarity = 100 - tannic_percentage_dif
        else (tannic_var != 0.0) && (bourbon1.tannic < bourbon2.tannic)
            tannic_percentage_dif = tannic_var / bourbon2.tannic.to_f * 100
            tannic_similarity = 100 - tannic_percentage_dif
        end

        if char_var == 0.0
            char_similarity = char_var + 100
        elsif (char_var != 0.0) && (bourbon1.char >= bourbon2.char)
            char_percentage_dif = char_var / bourbon1.char.to_f * 100
            char_similarity = 100 - char_percentage_dif
        else (char_var != 0.0) && (bourbon1.char < bourbon2.char)
            char_percentage_dif = char_var / bourbon2.char.to_f * 100
            char_similarity = 100 - char_percentage_dif
        end

        if sweet_var == 0.0
            sweet_similarity = sweet_var + 100
        elsif (sweet_var != 0.0) && (bourbon1.sweet >= bourbon2.sweet)
            sweet_percentage_dif = sweet_var / bourbon1.sweet.to_f * 100
            sweet_similarity = 100 - sweet_percentage_dif
        else (sweet_var != 0.0) && (bourbon1.sweet < bourbon2.sweet)
            sweet_percentage_dif = sweet_var / bourbon2.sweet.to_f * 100
            sweet_similarity = 100 - sweet_percentage_dif
        end

        if grainy_var == 0.0
            grainy_similarity = grainy_var + 100
        elsif (grainy_var != 0.0) && (bourbon1.grainy >= bourbon2.grainy)
            grainy_percentage_dif = grainy_var / bourbon1.grainy.to_f * 100
            grainy_similarity = 100 - grainy_percentage_dif
        else (grainy_var != 0.0) && (bourbon1.grainy < bourbon2.grainy)
            grainy_percentage_dif = grainy_var / bourbon2.grainy.to_f * 100
            grainy_similarity = 100 - grainy_percentage_dif
        end

        if vanilla_var == 0.0
            vanilla_similarity = vanilla_var + 100
        elsif (vanilla_var != 0.0) && (bourbon1.vanilla >= bourbon2.vanilla)
            vanilla_percentage_dif = vanilla_var / bourbon1.vanilla.to_f * 100
            vanilla_similarity = 100 - vanilla_percentage_dif
        else (vanilla_var != 0.0) && (bourbon1.vanilla < bourbon2.vanilla)
            vanilla_percentage_dif = vanilla_var / bourbon2.vanilla.to_f * 100
            vanilla_similarity = 100 - vanilla_percentage_dif
        end

        if corny_var == 0.0
            corny_similarity = corny_var + 100
        elsif (corny_var != 0.0) && (bourbon1.corny >= bourbon2.corny)
            corny_percentage_dif = corny_var / bourbon1.corny.to_f * 100
            corny_similarity = 100 - corny_percentage_dif
        else (corny_var != 0.0) && (bourbon1.corny < bourbon2.corny)
            corny_percentage_dif = corny_var / bourbon2.corny.to_f * 100
            corny_similarity = 100 - corny_percentage_dif
        end

        if buttery_var == 0.0
            buttery_similarity = buttery_var + 100
        elsif (buttery_var != 0.0) && (bourbon1.buttery >= bourbon2.buttery)
            buttery_percentage_dif = buttery_var / bourbon1.buttery.to_f * 100
            buttery_similarity = 100 - buttery_percentage_dif
        else (buttery_var != 0.0) && (bourbon1.buttery < bourbon2.buttery)
            buttery_percentage_dif = buttery_var / bourbon2.buttery.to_f * 100
            buttery_similarity = 100 - buttery_percentage_dif
        end

        if heat_var == 0.0
            heat_similarity = heat_var + 100
        elsif (heat_var != 0.0) && (bourbon1.heat >= bourbon2.heat)
            heat_percentage_dif = heat_var / bourbon1.heat.to_f * 100
            heat_similarity = 100 - heat_percentage_dif
        else (heat_var != 0.0) && (bourbon1.heat < bourbon2.heat)
            heat_percentage_dif = heat_var / bourbon2.heat.to_f * 100
            heat_similarity = 100 - heat_percentage_dif
        end

        if dark_fruit_var == 0.0
            dark_fruit_similarity = dark_fruit_var + 100
        elsif (dark_fruit_var != 0.0) && (bourbon1.dark_fruit >= bourbon2.dark_fruit)
            dark_fruit_percentage_dif = dark_fruit_var / bourbon1.dark_fruit.to_f * 100
            dark_fruit_similarity = 100 - dark_fruit_percentage_dif
        else (dark_fruit_var != 0.0) && (bourbon1.dark_fruit < bourbon2.dark_fruit)
            dark_fruit_percentage_dif = dark_fruit_var / bourbon2.dark_fruit.to_f * 100
            dark_fruit_similarity = 100 - dark_fruit_percentage_dif
        end

        if citrus_fruit_var == 0.0
            citrus_fruit_similarity = citrus_fruit_var + 100
        elsif (citrus_fruit_var != 0.0) && (bourbon1.citrus_fruit >= bourbon2.citrus_fruit)
            citrus_fruit_percentage_dif = citrus_fruit_var / bourbon1.citrus_fruit.to_f * 100
            citrus_fruit_similarity = 100 - citrus_fruit_percentage_dif
        else (citrus_fruit_var != 0.0) && (bourbon1.citrus_fruit < bourbon2.citrus_fruit)
            citrus_fruit_percentage_dif = citrus_fruit_var / bourbon2.citrus_fruit.to_f * 100
            citrus_fruit_similarity = 100 - citrus_fruit_percentage_dif
        end

        if floral_var == 0.0
            floral_similarity = floral_var + 100
        elsif (floral_var != 0.0) && (bourbon1.floral >= bourbon2.floral)
            floral_percentage_dif = floral_var / bourbon1.floral.to_f * 100
            floral_similarity = 100 - floral_percentage_dif
        else (floral_var != 0.0) && (bourbon1.floral < bourbon2.floral)
            floral_percentage_dif = floral_var / bourbon2.floral.to_f * 100
            floral_similarity = 100 - floral_percentage_dif
        end

        if spicy_var == 0.0
            spicy_similarity = spicy_var + 100
        elsif (spicy_var != 0.0) && (bourbon1.spicy >= bourbon2.spicy)
            spicy_percentage_dif = spicy_var / bourbon1.spicy.to_f * 100
            spicy_similarity = 100 - spicy_percentage_dif
        else (spicy_var != 0.0) && (bourbon1.spicy < bourbon2.spicy)
            spicy_percentage_dif = spicy_var / bourbon2.spicy.to_f * 100
            spicy_similarity = 100 - spicy_percentage_dif
        end

        if herbal_var == 0.0
            herbal_similarity = herbal_var + 100
        elsif (herbal_var != 0.0) && (bourbon1.herbal >= bourbon2.herbal)
            herbal_percentage_dif = herbal_var / bourbon1.herbal.to_f * 100
            herbal_similarity = 100 - herbal_percentage_dif
        else (herbal_var != 0.0) && (bourbon1.herbal < bourbon2.herbal)
            herbal_percentage_dif = herbal_var / bourbon2.herbal.to_f * 100
            herbal_similarity = 100 - herbal_percentage_dif
        end

        if malty_var == 0.0
            malty_similarity = malty_var + 100
        elsif (malty_var != 0.0) && (bourbon1.malty >= bourbon2.malty)
            malty_percentage_dif = malty_var / bourbon1.malty.to_f * 100
            malty_similarity = 100 - malty_percentage_dif
        else (malty_var != 0.0) && (bourbon1.malty < bourbon2.malty)
            malty_percentage_dif = malty_var / bourbon2.malty.to_f * 100
            malty_similarity = 100 - malty_percentage_dif
        end
        
        results = (toffee_similarity + woody_similarity + tannic_similarity + char_similarity + sweet_similarity + grainy_similarity + vanilla_similarity + corny_similarity + buttery_similarity + heat_similarity + dark_fruit_similarity + citrus_fruit_similarity + floral_similarity + spicy_similarity + herbal_similarity + malty_similarity) / 16
    end             
end
