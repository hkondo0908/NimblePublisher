defmodule NimbleSchoolWeb.BlogController do
  use NimbleSchoolWeb, :controller
  alias NimbleSchool.Blog
  def index(conn,_params) do
    render(conn,"index.html",posts: Blog.all_posts(),tags: Blog.all_tags(),recents: Blog.recent_posts())
  end
  def show(conn,%{"id" => id})do
    render(conn,"show.html",post: Blog.get_post_by_id!(id),tags: Blog.all_tags())
  end

  def tags(conn,_params) do
    render(conn,"index_by_tag.html",tags: Blog.all_tags())
  end

  def getByTag(conn,%{"tag" => tag})do
    render(conn,"get_posts_tag.html",tag: Blog.get_posts_by_tag!(tag),tags: Blog.all_tags())
  end

  def recent(conn,_params) do
    render(conn,"recent_posts.html",posts: Blog.recent_posts(),tags: Blog.all_tags())
  end
end
