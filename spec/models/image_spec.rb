require 'rails_helper'

RSpec.describe Image, type: :model do
  let(:image) {Image.create(url: "image.com")}

  it 'responds to ideas' do
    image.ideas.create(title: "Some title", body: "some body")

    expect(image.ideas.first.title).to eq("Some title")
  end

  it 'must have a url' do
    image.url = nil

    expect(image).not_to be_valid
  end

  it 'is valid with a url' do
    expect(image).to be_valid
  end
end
