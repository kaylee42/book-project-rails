require 'rails_helper'

describe User do
  
  describe "#friends" do
    context "when the user is a loner" do
      it 'returns empty' do
        dan = User.create(name: 'dan Lev', username: 'dleve123', password: 'password123')\

        expect(dan.friends).to be_empty
      end
    end

    context "when the user friends a couple of people" do
      it 'retuns users that I friended' do
        dan = User.create(name: 'dan Lev', username: 'dleve123', password: 'password123')
        friend_one = User.create(name: 'kylo', username: 'thekylo', password: 'ilovedarthvadar')
        friend_two = User.create(name: 'rai', username: 'lukesdaughter', password: 'ihatedarthvadar')
        dan.friends = [friend_one, friend_two]

        expect(dan.friends).to match_array([friend_one, friend_two])
      end
    end

    context "when a couple of people friend the user" do
      it 'returns users that friended me' do
        dan = User.create(name: 'dan Lev', username: 'dleve123', password: 'password123')
        friend_one = User.create(name: 'kylo', username: 'thekylo', password: 'ilovedarthvadar')
        friend_one.friends = [dan]
        expect(dan.friends).to include(friend_one)
      end
    end

    xcontext "when the user and someone else both friend each "


  end
end
