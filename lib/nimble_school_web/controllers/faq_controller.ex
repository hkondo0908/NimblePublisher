defmodule NimbleSchoolWeb.FaqController do
  use NimbleSchoolWeb, :controller
  alias NimbleSchool.Faq
  def index(conn,_params) do
    render(conn,"index.html",faqs: Faq.all_faqs(),tags: Faq.all_tags())
  end
  def show(conn,%{"id" => id})do
    render(conn,"show.html",faq: Faq.get_faq_by_id!(id),tags: Faq.all_tags())
  end

  def tags(conn,_params) do
    render(conn,"index_by_tag.html",tags: Faq.all_tags())
  end

  def getByTag(conn,%{"tag" => tag})do
    render(conn,"get_faqs_tag.html",faqs: Faq.get_faqs_by_tag!(tag),tags: Faq.all_tags())
  end
end
