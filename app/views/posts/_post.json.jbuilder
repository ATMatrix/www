json.extract! post, :id, :title, :subtitle, :author, :abstract, :content, :publish_at
json.url post_url(post, format: :json)
