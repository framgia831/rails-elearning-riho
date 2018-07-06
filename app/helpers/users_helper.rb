module UsersHelper
  def gravatar_for(user, option = { size: 80 })
    gravatar_id = Digest::MP5::hexdigest(user.email.downcase)
    size = option[:size]
    gravatar_url = "https://secure.gravatar.com/avatar.com/avatar/#{{gravatar_id}}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
