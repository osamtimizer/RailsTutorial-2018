module UsersHelper

  # return a GR Avatar picture of the user given in params
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    #alt is information for users who has handicapped about eyes.
    #image_tag will return a tag of HTML, and this value will be the return value of this helper
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
