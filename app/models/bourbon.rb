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

    #### SIMILARITY ALGORITH ####

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
        else (toffee_var != 0.0) && (bourbon1.toffee < bourbon2.toffee)
            toffee_percentage_dif = toffee_var / bourbon2.toffee.to_f * 100
        end
            
        if woody_var == 0.0
            woody_similarity = woody_var + 100
        elsif (woody_var != 0.0) && (bourbon1.woody >= bourbon2.woody)
            woody_percentage_dif = woody_var / bourbon1.woody.to_f * 100
        else (woody_var != 0.0) && (bourbon1.woody < bourbon2.woody)
            woody_percentage_dif = woody_var / bourbon2.woody.to_f * 100
        end

        if tannic_var == 0.0
            tannic_similarity = tannic_var + 100
        elsif (tannic_var != 0.0) && (bourbon1.tannic >= bourbon2.tannic)
            tannic_percentage_dif = tannic_var / bourbon1.tannic.to_f * 100
        else (tannic_var != 0.0) && (bourbon1.tannic < bourbon2.tannic)
            tannic_percentage_dif = tannic_var / bourbon2.tannic.to_f * 100
        end

        if char_var == 0.0
            char_similarity = char_var + 100
        elsif (char_var != 0.0) && (bourbon1.char >= bourbon2.char)
            char_percentage_dif = char_var / bourbon1.char.to_f * 100
        else (char_var != 0.0) && (bourbon1.char < bourbon2.char)
            char_percentage_dif = char_var / bourbon2.char.to_f * 100
        end

        if sweet_var == 0.0
            sweet_similarity = sweet_var + 100
        elsif (sweet_var != 0.0) && (bourbon1.sweet >= bourbon2.sweet)
            sweet_percentage_dif = sweet_var / bourbon1.sweet.to_f * 100
        else (sweet_var != 0.0) && (bourbon1.sweet < bourbon2.sweet)
            sweet_percentage_dif = sweet_var / bourbon2.sweet.to_f * 100
        end

        if grainy_var == 0.0
            grainy_similarity = grainy_var + 100
        elsif (grainy_var != 0.0) && (bourbon1.grainy >= bourbon2.grainy)
            grainy_percentage_dif = grainy_var / bourbon1.grainy.to_f * 100
        else (grainy_var != 0.0) && (bourbon1.grainy < bourbon2.grainy)
            grainy_percentage_dif = grainy_var / bourbon2.grainy.to_f * 100
        end

        if vanilla_var == 0.0
            vanilla_similarity = vanilla_var + 100
        elsif (vanilla_var != 0.0) && (bourbon1.vanilla >= bourbon2.vanilla)
            vanilla_percentage_dif = vanilla_var / bourbon1.vanilla.to_f * 100
        else (vanilla_var != 0.0) && (bourbon1.vanilla < bourbon2.vanilla)
            vanilla_percentage_dif = vanilla_var / bourbon2.vanilla.to_f * 100
        end

        if corny_var == 0.0
            corny_similarity = corny_var + 100
        elsif (corny_var != 0.0) && (bourbon1.corny >= bourbon2.corny)
            corny_percentage_dif = corny_var / bourbon1.corny.to_f * 100
        else (corny_var != 0.0) && (bourbon1.corny < bourbon2.corny)
            corny_percentage_dif = corny_var / bourbon2.corny.to_f * 100
        end

        if buttery_var == 0.0
            buttery_similarity = buttery_var + 100
        elsif (buttery_var != 0.0) && (bourbon1.buttery >= bourbon2.buttery)
            buttery_percentage_dif = buttery_var / bourbon1.buttery.to_f * 100
        else (buttery_var != 0.0) && (bourbon1.buttery < bourbon2.buttery)
            buttery_percentage_dif = buttery_var / bourbon2.buttery.to_f * 100
        end

        if heat_var == 0.0
            heat_similarity = heat_var + 100
        elsif (heat_var != 0.0) && (bourbon1.heat >= bourbon2.heat)
            heat_percentage_dif = heat_var / bourbon1.heat.to_f * 100
        else (heat_var != 0.0) && (bourbon1.heat < bourbon2.heat)
            heat_percentage_dif = heat_var / bourbon2.heat.to_f * 100
        end

        if dark_fruit_var == 0.0
            dark_fruit_similarity = dark_fruit_var + 100
        elsif (dark_fruit_var != 0.0) && (bourbon1.dark_fruit >= bourbon2.dark_fruit)
            dark_fruit_percentage_dif = dark_fruit_var / bourbon1.dark_fruit.to_f * 100
        else (dark_fruit_var != 0.0) && (bourbon1.dark_fruit < bourbon2.dark_fruit)
            dark_fruit_percentage_dif = dark_fruit_var / bourbon2.dark_fruit.to_f * 100
        end

        if citrus_fruit_var == 0.0
            citrus_fruit_similarity = citrus_fruit_var + 100
        elsif (citrus_fruit_var != 0.0) && (bourbon1.citrus_fruit >= bourbon2.citrus_fruit)
            citrus_fruit_percentage_dif = citrus_fruit_var / bourbon1.citrus_fruit.to_f * 100
        else (citrus_fruit_var != 0.0) && (bourbon1.citrus_fruit < bourbon2.citrus_fruit)
            citrus_fruit_percentage_dif = citrus_fruit_var / bourbon2.citrus_fruit.to_f * 100
        end

        if floral_var == 0.0
            floral_similarity = floral_var + 100
        elsif (floral_var != 0.0) && (bourbon1.floral >= bourbon2.floral)
            floral_percentage_dif = floral_var / bourbon1.floral.to_f * 100
        else (floral_var != 0.0) && (bourbon1.floral < bourbon2.floral)
            floral_percentage_dif = floral_var / bourbon2.floral.to_f * 100
        end

        if spicy_var == 0.0
            spicy_similarity = spicy_var + 100
        elsif (spicy_var != 0.0) && (bourbon1.spicy >= bourbon2.spicy)
            spicy_percentage_dif = spicy_var / bourbon1.spicy.to_f * 100
        else (spicy_var != 0.0) && (bourbon1.spicy < bourbon2.spicy)
            spicy_percentage_dif = spicy_var / bourbon2.spicy.to_f * 100
        end

        if herbal_var == 0.0
            herbal_similarity = herbal_var + 100
        elsif (herbal_var != 0.0) && (bourbon1.herbal >= bourbon2.herbal)
            herbal_percentage_dif = herbal_var / bourbon1.herbal.to_f * 100
        else (herbal_var != 0.0) && (bourbon1.herbal < bourbon2.herbal)
            herbal_percentage_dif = herbal_var / bourbon2.herbal.to_f * 100
        end

        if malty_var == 0.0
            malty_similarity = malty_var + 100
        elsif (malty_var != 0.0) && (bourbon1.malty >= bourbon2.malty)
            malty_percentage_dif = malty_var / bourbon1.malty.to_f * 100
        else (malty_var != 0.0) && (bourbon1.malty < bourbon2.malty)
            malty_percentage_dif = malty_var / bourbon2.malty.to_f * 100
        end

        # Divide the dif by the larger value of bourbon1/2 to get the % difference 
        # if bourbon1.buttery >= bourbon2.toffee
        #     toffee_percentage_dif = toffee_var / bourbon1.toffee.to_f * 100
        # else bourbon1.toffee < bourbon2.toffee
        #     toffee_percentage_dif = toffee_var / bourbon2.toffee.to_f * 100
        # end

        # if bourbon1.woody >= bourbon2.woody
        #     woody_percentage_dif = woody / bourbon1 * 100
        # else bourbon1.woody < bourbon2.woody
        #     woody_percentage_dif = woody / bourbon2 * 100
        # end

        # if bourbon1.tannic >= bourbon2.tannic
        #     tannic_percentage_dif = tannic / bourbon1 * 100
        # else bourbon1.tannic < bourbon2.tannic
        #     tannic_percentage_dif = tannic / bourbon2 * 100
        # end

        # if bourbon1.char >= bourbon2.char
        #     char_percentage_dif = char / bourbon1 * 100
        # else bourbon1.char < bourbon2.char
        #     char_percentage_dif = char / bourbon2 * 100
        # end

        # if bourbon1.sweet >= bourbon2.sweet
        #     sweet_percentage_dif = sweet / bourbon1 * 100
        # else bourbon1.sweet < bourbon2.sweet
        #     sweet_percentage_dif = sweet / bourbon2 * 100
        # end

        # if bourbon1.grainy >= bourbon2.grainy
        #     grainy_percentage_dif = grainy / bourbon1 * 100
        # else bourbon1.grainy < bourbon2.grainy
        #     grainy_percentage_dif = grainy / bourbon2 * 100
        # end

        # if bourbon1.vanilla >= bourbon2.vanilla
        #     vanilla_percentage_dif = vanilla / bourbon1 * 100
        # else bourbon1.vanilla < bourbon2.vanilla
        #     vanilla_percentage_dif = vanilla / bourbon2 * 100
        # end

        # if bourbon1.corny >= bourbon2.corny
        #     corny_percentage_dif = corny / bourbon1 * 100
        # else bourbon1.corny < bourbon2.corny
        #     corny_percentage_dif = corny / bourbon2 * 100
        # end

        # if bourbon1.buttery >= bourbon2.buttery
        #     buttery_percentage_dif = buttery / bourbon1 * 100
        # else bourbon1.buttery < bourbon2.buttery
        #     buttery_percentage_dif = buttery / bourbon2 * 100
        # end

        # if bourbon1.heat >= bourbon2.heat
        #     heat_percentage_dif = heat / bourbon1 * 100
        # else bourbon1.heat < bourbon2.heat
        #     heat_percentage_dif = heat / bourbon2 * 100
        # end

        # if bourbon1.dark_fruit >= bourbon2.dark_fruit
        #     dark_fruit_percentage_dif = dark_fruit / bourbon1 * 100
        # else bourbon1.dark_fruit < bourbon2.dark_fruit
        #     dark_fruit_percentage_dif = dark_fruit / bourbon2 * 100
        # end

        # if bourbon1.citrus_fruit >= bourbon2.citrus_fruit
        #     citrus_fruit_percentage_dif = citrus_fruit / bourbon1 * 100
        # else bourbon1.citrus_fruit < bourbon2.citrus_fruit
        #     citrus_fruit_percentage_dif = citrus_fruit / bourbon2 * 100
        # end

        # if bourbon1.floral >= bourbon2.floral
        #     floral_percentage_dif = floral / bourbon1 * 100
        # else bourbon1.floral < bourbon2.floral
        #     floral_percentage_dif = floral / bourbon2 * 100
        # end

        # if bourbon1.spicy >= bourbon2.spicy
        #     spicy_percentage_dif = spicy / bourbon1 * 100
        # else bourbon1.spicy < bourbon2.spicy
        #     spicy_percentage_dif = spicy / bourbon2 * 100
        # end

        # if bourbon1.herbal >= bourbon2.herbal
        #     herbal_percentage_dif = herbal / bourbon1 * 100
        # else bourbon1.herbal < bourbon2.herbal
        #     herbal_percentage_dif = herbal / bourbon2 * 100
        # end

        # if bourbon1.malty >= bourbon2.malty
        #     malty_percentage_dif = malty / bourbon1 * 100
        # else bourbon1.malty < bourbon2.malty
        #     malty_percentage_dif = malty / bourbon2 * 100
        # end

        # Subtract each dif from 100 to get the final %, but if percentage_dif = 0 then add 100 first
        # if toffee_percentage_dif == 0
        #     toffee_similarty = toffee_percentage_dif + 100
        # else
        #     toffee_similarty = 100 - toffee_percentage_dif
        # end
     
       # 0.28571429 * 100 = 28.57

               # Bourbon.percent_difference(toffee)
        # Bourbon.percent_difference(woody)
        # Bourbon.percent_difference(tannic)
        # Bourbon.percent_difference(char)
        # Bourbon.percent_difference(sweet)
        # Bourbon.percent_difference(grainy)
        # Bourbon.percent_difference(vanilla)
        # Bourbon.percent_difference(corny)
        # Bourbon.percent_difference(buttery)
        # Bourbon.percent_difference(heat)
        # Bourbon.percent_difference(dark_fruit)
        # Bourbon.percent_difference(citrus_fruit)
        # Bourbon.percent_difference(floral)
        # Bourbon.percent_difference(spicy)
        # Bourbon.percent_difference(herbal)
        # Bourbon.percent_difference(malty)
    end

    # def self.percent_difference(var)
    #     if bourbon1.var >= bourbon2.var
    #         var_percentage_dif = var / bourbon1 * 100
    #     else bourbon1.var < bourbon2.var
    #         var_percentage_dif = var / bourbon2 * 100
    #     end
    #     var_percentage_dif
    # end
end
