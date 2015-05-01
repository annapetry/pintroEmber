require 'rails_helper'

describe UsersController do
  
  let (:user_params) { { username: 'Juanny', first_name: 'Juan', last_name: 'Mogielnicki', password: 'lover',
    location: 'SF, CA', description: 'One cool data dude', email: 'jaun@mogs.com', avatar_url: 'http://www.annapetry.com/assets/petry.jpg' } }
  let (:user) { User.create user_params }

  describe "POST 'create'" do
    context "with appropriate user params" do
      it "creates a user" do
        expect(user.id).to_not eq nil
      end
      it "redirects user to root_url" do
        expect(request.path).to eq ("")
      end
    end
  end
end
