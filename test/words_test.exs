defmodule WordsTest do
  use ExUnit.Case
  doctest Words

  test "greets the world" do
    assert Words.hello() == :world
  end
end
