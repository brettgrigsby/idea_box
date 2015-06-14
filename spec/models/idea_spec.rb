require 'rails_helper'

RSpec.describe Idea, type: :model do
  let(:main_idea) {Idea.create(title: "Idea One", body: "Idea body one")}

  it 'must have a title' do
    idea = Idea.create(body: "Idea body one")

    expect(idea).to_not be_valid

    expect(main_idea.title).to eq "Idea One"
  end

  it 'must have a body' do
    idea = Idea.create(title: "Idea One")

    expect(idea).to_not be_valid

    expect(main_idea.body).to eq "Idea body one"
  end

  it 'respond to images' do
    main_idea.images.create(url: "image.com")

    expect(main_idea.images.first.url).to eq("image.com")
  end
end
