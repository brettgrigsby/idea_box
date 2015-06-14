require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { Category.create(title: "Spec") }

  it "is valid" do
    expect(category).to be_valid
    expect(category.title).to eq('Spec')
  end

  it "is invalid without a title" do
    category.title = nil
    expect(category).not_to be_valid
  end
end
