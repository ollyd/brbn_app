# Reset the database
User.destroy_all
Bourbon.destroy_all
Rating.destroy_all

# Users' Seed
u1 = User.create(:email => 'bob@gmail.com', :password => 'bobby1234', :password_confirmation => 'bobby1234')
u2 = User.create(:email => 'anne@gmail.com', :password => 'anne1234', :password_confirmation => 'anne1234')
u3 = User.create(:email => 'sue@gmail.com', :password => 'suzy1234', :password_confirmation => 'suzy1234')
u4 = User.create(:email => 'mike@gmail.com', :password => 'mike1234', :password_confirmation => 'mike1234')
u5 = User.create(:email => 'joe@gmail.com', :password => 'joey1234', :password_confirmation => 'joey1234')
u6 = User.create(:email => 'billy@gmail.com', :password => 'billy1234', :password_confirmation => 'billy1234')

# Admin's Seed
# admin = Admin.create(:username => 'admin', :email => 'admin@admin.com', :password => 'admin', :password_confirmation => 'admin', :admin => true)

# Bourbons
b1 = Bourbon.create(:name => 'Pappy Van Winkle\'s 23yr', :alcohol => 47.8, :image => 'http://oldripvanwinkle.com/wp-content/uploads/2011/10/23ylabel1.jpg', 
    :description => 'Dubbed the world\'s most sought after bourbon, this bottling of Pappy Van Winkle’s Family Reserve is aged for 23 years. It has a rich copper color with 
                    fruity, buttery caramel fudge, roasted pecans, and fine brown spice aromas. With a medium-full body and a long, lingering cherry tobacco, 
                    toffee, raisin toast, charcoal, and peppery spice finish. A sensationally flavourful and deep bourbon for sipping or cocktails.', 
    :toffee => 6, :woody => 7, :tannic => 5, :char => 7, :sweet => 8, :grainy => 3, :vanilla => 3, :corny => 7, :buttery => 7, 
    :heat => 6, :dark_fruit => 8, :citrus_fruit => 4, :floral => 3, :spicy => 9, :herbal => 2, :malty => 3)

b2 = Bourbon.create(:name => 'Four Roses Small Batch 2010', :alcohol => 55.1, :image => 'http://ae-lane-report.s3.amazonaws.com/wp-content/uploads/2013/12/FourRoses.png', 
    :description => 'Deep amber color. Enticing aromas of creme brulee, dried stone fruit chutney, chocolate cherries, spice, and menthol tobacco with a 
                    round, vibrant fruity-yet-dry full body and a rich, long interplay of exotic spices and tropical fruits on the finish. Deliciously 
                    decadent, incredibly smooth for its proof, and so complex and captivating it\'s almost impossible to put down.', 
    :toffee => 3, :woody => 3, :tannic => 3, :char => 4, :sweet => 5, :grainy => 6, :vanilla => 7, :corny => 4, :buttery => 6, 
    :heat => 4, :dark_fruit => 4, :citrus_fruit => 8, :floral => 7, :spicy => 9, :herbal => 5, :malty => 4)

b3 = Bourbon.create(:name => 'Jefferson\'s Reserve', :alcohol => 45.1, :image => 'http://vodka-store.com/543-816-thickbox/jefferson-s-reserve-bourbon-very-old-451-70cl.jpg', 
    :description => 'Amber color. Aromas of buttery caramel and kettlecorn and grain cereal with a silky dry-yet-fruity medium-to-full body and a cherry cola, brown spice, 
                    honeyed nut and mossy limestone finish. A very nice sipper.', 
    :toffee => 2, :woody => 2, :tannic => 5, :char => 4, :sweet => 5, :grainy => 6, :vanilla => 4, :corny => 6, :buttery => 7, 
    :heat => 4, :dark_fruit => 4, :citrus_fruit => 2, :floral => 2, :spicy => 7, :herbal => 5, :malty => 2)

b4 = Bourbon.create(:name => 'Wild Turkey Rare Breed', :alcohol => 54.1, :image => 'http://img2.findthebest.com/sites/default/files/821/media/images/Wild_Turkey_Rare_Breed_Bourbon_294020.jpg', 
    :description => 'Copper color. Dense aromas of coconut, caramel, cherry, and glued wood with a supple, dry-yet-fruity medium-full body and a long, hot, dried fruit, anise, 
    spiced nut, cocoa and white pepper driven. A little water rounds this out brilliantly and brings out a lot of nut and wood tones.', 
    :toffee => 4, :woody => 8, :tannic => 6, :char => 7, :sweet => 6, :grainy => 4, :vanilla => 3, :corny => 6, :buttery => 5, 
    :heat => 8, :dark_fruit => 6, :citrus_fruit => 4, :floral => 2, :spicy => 7, :herbal => 3, :malty => 5)

b5 = Bourbon.create(:name => 'Jim Beam Black Label 8yr', :alcohol => 43, :image => 'http://1.bp.blogspot.com/-dSaJchssTJs/Uwuq7uHsz6I/AAAAAAAAGZ0/vQWj3qp7HCU/s1600/Jim+Beam+Black+Label.jpg', 
    :description => 'Amber color. Robust aromas of caramelized nuts, melted chocolate, dried stone fruits, and delicate baking spices with a supple, 
                    fruity-yet-dry, medium-to-full body and a long cola, praline cookie, cedar, and mineral finish. A great sipping or mixing 
                    whisky.', 
    :toffee => 1, :woody => 3, :tannic => 3, :char => 4, :sweet => 4, :grainy => 7, :vanilla => 3, :corny => 3, :buttery => 2, 
    :heat => 6, :dark_fruit => 2, :citrus_fruit => 5, :floral => 1, :spicy => 3, :herbal => 3, :malty => 9)

b6 = Bourbon.create(:name => 'Knob Creek 9yr Single Barrel', :alcohol => 60, :image => 'http://static.wine-searcher.net/images/labels/81/47/knob-creek-single-barrel-reserve-9-year-old-straight-bourbon-whiskey-kentucky-usa-10218147.jpg', 
    :description => 'Rich amber color. Aromas of toasty nut brittle, creme brulee, sarsaparilla, dried cherry, and sweet and peppery spices with 
                    supple, lightly tannic fruity-yet-dry full body and a long, vanilla toffee, dried fruit, pepper and mineral flourish. 
                    A full-throttled flavor packed bourbon that is delicious on its own and a superb choice for cocktails.', 
    :toffee => 8, :woody => 3, :tannic => 6, :char => 4, :sweet => 7, :grainy => 7, :vanilla => 9, :corny => 6, :buttery => 4, 
    :heat => 6, :dark_fruit => 8, :citrus_fruit => 5, :floral => 4, :spicy => 5, :herbal => 3, :malty => 2)

# Ratings
r1 = Rating.create(:score => 5)
r2 = Rating.create(:score => 5)
r3 = Rating.create(:score => 4)
r4 = Rating.create(:score => 3)
r5 = Rating.create(:score => 5)
r6 = Rating.create(:score => 3)

b1.ratings << r1
b1.ratings << r2
b1.ratings << r3
b2.ratings << r4
b3.ratings << r5
b4.ratings << r6

u1.ratings << r1
u2.ratings << r2
u3.ratings << r3
u4.ratings << r4
u5.ratings << r5
u6.ratings << r6



