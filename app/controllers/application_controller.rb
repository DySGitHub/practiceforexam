class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
<<<<<<< c1d4ec6b3d9de6a5800eab220d35830a099fd1bc
       include SessionsHelper        # NEW
=======
     include SessionsHelper
>>>>>>> User microposting feature
end
