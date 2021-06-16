defmodule NimbleSchool.Faq.Question do
  @enforce_keys [:id, :author, :question, :answer, :tags]
  defstruct [:id, :author, :question, :answer, :tags]

  def build(filename, attrs, body)do
    id = filename |> String.split() |> Enum.at(0)
    struct(__MODULE__,[id: id,answer: body]++Map.to_list(attrs))
  end
end
