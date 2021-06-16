defmodule NimbleSchool.Faq do
  alias NimbleSchool.Faq.Question
  use NimblePublisher,
    build: Question,
    from: Application.app_dir(:nimble_school,"priv/faqs/*.md"),
    as: :faqs,
    highlighters: [:makeup_elixir, :makeup_erlang]
  @faqs Enum.sort_by(@faqs,& &1.id,:desc)
  @tags @faqs |> Enum.flat_map(& &1.tags) |> Enum.uniq() |> Enum.sort()
  def all_faqs, do: @faqs
  def all_tags,  do: @tags

  def recent_faqs(num \\ 5), do: Enum.take(all_faqs(),num)

  defmodule NotFoundError, do: defexception [:message, plug_status: 404]
  def get_faq_by_id!(id) do
    Enum.find(all_faqs(),&(&1.id == id)) ||
      raise NotFoundError, "faq with id = #{id} not found"
  end
  def get_faqs_by_tag!(tag)do
    case Enum.filter(all_faqs(),&(tag in &1.tags)) do
      [] -> raise NotFoundError, "faqs with tag=#{tag} not found"
      faqs -> faqs
    end
  end
end
