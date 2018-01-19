defmodule QuizTest do
  use ExUnit.Case
  doctest Quiz

  test "greets the world" do
    assert Quiz.hello() == :world
  end
end
