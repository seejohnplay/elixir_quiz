defmodule ElixirQuizTest do
  use ExUnit.Case
  doctest ElixirQuiz

  test "greets the world" do
    assert ElixirQuiz.hello() == :world
  end
end
