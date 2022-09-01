require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create :user }
  let(:new_user) { build :user }

  describe 'Validations' do
    context 'Invalid attributes' do
      it "email is invalid and can't be blank" do
        new_user.email = nil
        new_user.valid?
        expect(new_user.errors[:email]).to eq(["can't be blank", "is invalid"])
      end

      it "invalid email" do
        new_user.email = "tes"
        new_user.valid?
        expect(new_user.errors[:email]).to eq(["is invalid"])
      end

       it "email has already been taken" do
        new_user.email = user.email
        new_user.valid?
        expect(new_user.errors[:email]).to eq(["has already been taken"])
      end

      it "name can't be blank" do
        new_user.name = nil
        new_user.valid?
        expect(new_user.errors[:name]).to eq(["can't be blank"])
      end
    end
  end

end
