defmodule Tokenizer.Struct.Underlying do
  defstruct [
    :source,
    rules: [],
    line: 0,
    column: 0
  ]

  @type t :: %__MODULE__{
          source: String.t(),
          rules: list(map()),
          line: integer(),
          column: integer()
        }

  @spec rule(t, Regex.t(), atom()) :: t
  def rule(%__MODULE__{} = self, pattern, type) do
    %__MODULE__{self | rules: [%{pattern: pattern, type: type} | self.rules]}
  end

  @spec source(t, String.t()) :: t
  def source(%__MODULE__{} = self, source) do
    %__MODULE__{self | source: source}
  end

  @spec start(t) :: list(map)
  def start(%__MODULE__{} = self) do
    self.rules
  end
end
