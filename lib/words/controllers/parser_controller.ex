defmodule Words.Controllers.Parser do
  use Phoenix.Controller
  alias Words.Domain.Parser

  def sort(conn, %{"words" => words}) do
    {:ok, words} = Jason.decode(words)
    sorted_words = Parser.sort_words(words)
    json(conn, %{"data" => sorted_words})
  end

  def concat(conn, %{"words" => words}) do
    {:ok, words} = Jason.decode(words)
    concatenated_words = Parser.concat(words)
    json(conn, %{"data" => concatenated_words})
  end

  def frequency(conn, %{"words" => words}) do
    {:ok, words} = Jason.decode(words)
    words_frequency = Parser.frequency(words)
    json(conn, %{"data" => words_frequency})
  end

  def snake_case(conn, %{"word" => word}) do
    snake_case_word = Parser.snake_case(word)
    json(conn, %{"data" => snake_case_word})
  end
end
