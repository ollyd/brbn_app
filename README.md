#Background

Most people who drink bourbon know they like a certain brand or brands, but don't know what specific flavours comprise their beloved drink. The avergae man's palette isn't reifined enough for whiskey tasting.

Brbn solves this problem by allowing you to search for the bourbon you love dearest, telling you the prominence of certain notes within it, and recommending similar bourbons for you to enjoy, based on similarity.  

##Site Features

- Search and compare bourbons 
- View average user ratings
- View descriptions and spcific notes witin each bourbon

##Specifications

### Front end:

- Marionette
- Backbone
- ModelBinder
- jQuery
- Handlebars
- Bootstrap

### Back end

- Postgresql
- Active Record
- Rails

##Data Model

Backbone Models:

- autoComplete
- bourbon
- rating
- user
- user_password_recovery
- user_registration
- user_session

Rails Models:

- Bourbon, (has_many :ratings)
- Rating, (belongs_to :user, belongs_to :bourbon)
- User, (has_many :ratings)

####Frameworks

- D3js
- Raty

####Gems

- jquery-ui-rails
- therubyracer
- bootstrap-sass
- protected_attributes
- rails_12factor
- thread_safe', '0.2.0
- devise
- rails-backbone
- modernizr-rails
- underscore-rails
- handlebars_assets

#####Development
- pry-rails
- gry-debugger
- pry-stack_explorer
- better_errors
- annotate

#####Test
- rspec-rails
- shoulda-matchers
- simplecov


--------------
## To Do

- Fucntionality for user comments, for each bourbon
- Functionality to search for bourbons by flavour notes, not just by brand
- User ratings saving to db
- Add more bourbons to db
- Admin/user authentication
- Add thumb images to search results 

--------------

Thanks to Joel Turnbull and Mathilda Thompson at GA Sydney for their help with this. 