# frozen_string_literal: true

require 'test_helper'

class ChatCallerSvcTest < ActiveSupport::TestCase
  test "should require an input and not save" do
    ask = Ask.new
    assert_not ask.save, "did not require an input"
  end

  test "should query the OpenAI API endpoint without error" do
    assert_nothing_raised do
      ChatCallerSvc.call("this is a message")
    end
  end

  test "should save after querying API" do
  #    assert the most recent ask.title is not the same as the input
  end

end