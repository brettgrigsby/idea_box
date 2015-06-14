require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: "coolducky", password: "pass") }

  it "is valid" do
    expect(user).to be_valid
  end

  it "is not valid without a name" do
    user.name = nil
    expect(user).to_not be_valid
  end

  it "is not valid without a password" do
    user.password = nil
    expect(user).to_not be_valid
  end

end
