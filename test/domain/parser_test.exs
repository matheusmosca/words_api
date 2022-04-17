defmodule Words.Domain.ParserTest do
  use ExUnit.Case, async: true
  doctest Words.Domain.Parser

  describe "Words.Domain.Parser.frequency/1" do
    test "should return a map with the frequency of each word appearence" do
      words = ~w(banana apple banana orange coconut coconut)
      assert Words.Domain.Parser.frequency(words) == %{"banana" => 2, "apple" => 1, "coconut" => 2, "orange" => 1}
      assert Words.Domain.Parser.frequency([]) == %{}
    end
  end

  describe "Words.Domain.Parser.concat/1" do
    test "should concatenate all words" do
      words = ~w(banana apple pie banana orange coconut pie)
      assert Words.Domain.Parser.concat(words) == "bananaapplepiebananaorangecoconutpie"
      assert Words.Domain.Parser.concat([]) == ""
    end
  end

  describe "Words.Domain.Parser.snake_case/1" do
    test "should turn a word into a snake_case format" do
      assert Words.Domain.Parser.snake_case("sNake CAsE thiS strinG") == "snake_case_this_string"
      assert Words.Domain.Parser.snake_case("") == ""
    end
  end

  describe "Words.Domain.Parser.sort_words/1" do
    test "should sort a list of words with ascending order" do
      descending_ordered_words = ~w(h g f e d c b a)
      ascending_ordered_words = ~w(a b c d e f g h)
      random_ordered_words = ~w(h g d f c e b a)

      assert Words.Domain.Parser.sort_words(["a"]) == ["a"]
      assert Words.Domain.Parser.sort_words([]) == []
      assert Words.Domain.Parser.sort_words(descending_ordered_words) == ~w(a b c d e f g h)
      assert Words.Domain.Parser.sort_words(ascending_ordered_words) == ~w(a b c d e f g h)
      assert Words.Domain.Parser.sort_words(random_ordered_words) == ~w(a b c d e f g h)
    end
  end
end
