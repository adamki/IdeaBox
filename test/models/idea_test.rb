require 'test_helper'

class IdeaTest < ActiveSupport::TestCase

  def valid_params
    {name: "string"}
  end

  it 'is valid with valid params' do
    idea = Idea.new valid_params
    idea.must_be :valid?
  end

  it 'is invalid without a name' do
    params = valid_params.clone
    params.delete :name
    idea = Idea.new params

    idea.wont_be :valid?
  end

end
