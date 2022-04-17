defmodule Words.Domain.Parser do
  def snake_case(word) do
    word
    |> String.downcase()
    |> String.replace(" ", "_")
  end

  def concat(words) do
    Enum.reduce(words, "", fn word, acc -> acc <> word end)
  end

  def frequency(_words, _frequency_map \\ %{})
  def frequency([], frequency_map), do: frequency_map

  def frequency([word | tail], frequency_map) do
    case Map.get(frequency_map, word) do
      nil -> frequency(tail, Map.put(frequency_map, word, 1))
      word_frequency -> frequency(tail, Map.put(frequency_map, word, word_frequency + 1))
    end
  end

  def sort_words(words) when length(words) <= 1, do: words

  def sort_words(words) do
    {left, right} = Enum.split(words, length(words) |> div(2))
    left = sort_words(left)
    right = sort_words(right)

    merge_word_lists(left, right)
  end

  defp merge_word_lists(_list1, _list2, merged_list \\ [])
  defp merge_word_lists([], list2, merged_list), do: merged_list ++ list2
  defp merge_word_lists(list1, [], merged_list), do: merged_list ++ list1

  defp merge_word_lists([l1_head | l1_tail], [l2_head | l2_tail], merged_list) do
    if l1_head < l2_head do
      merge_word_lists(l1_tail, [l2_head] ++ l2_tail, merged_list ++ [l1_head])
    else
      merge_word_lists([l1_head] ++ l1_tail, l2_tail, merged_list ++ [l2_head])
    end
  end
end
