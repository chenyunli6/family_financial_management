module ApplicationHelper
  def render_toggle_hidden_link(post)
    text = post.is_hidden ? "发布文章" : "隐藏文章"
    link_to text, toggle_hidden_post_path(post), method: :post, class: "btn btn-primary"
  end
end
