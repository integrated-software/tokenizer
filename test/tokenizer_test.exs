defmodule TokenizerTest do
  import Tokenizer.Struct.Underlying
  use ExUnit.Case
  doctest Tokenizer

  test "creating instance." do
    tokenizer =
      %Tokenizer.Struct.Underlying{}
      |> rule(~r/\d+/, :digit)
      |> rule(~r/[A-Z][a-z]+/, :ident)
      |> source("1230")

    rules = tokenizer.rules

    assert rules == [
             %{pattern: ~r/[A-Z][a-z]+/, type: :ident},
             %{pattern: ~r/\d+/, type: :digit}
           ]
  end
end
