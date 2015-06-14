require 'rails_helper'

RSpec.describe Idea, type: :model do
  it 'must have a title' do
    idea = Idea.create(body: "Idea body one")

    expect(idea).to_not be_valid

    idea = Idea.create(title: "Idea One", body: "Idea body one")

    expect(idea.title).to eq "Idea One"

  end

  it 'must have a body' do
    idea = Idea.create(title: "Idea One")

    expect(idea).to_not be_valid

    idea = Idea.create(title: "Idea One", body: "Idea body one")

    expect(idea.body).to eq "Idea body one"
  end

end
