module UsersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    gravatar_default = "http://www.gravatar.com/avatar/?d=https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Paint_palette_icon_from_the_Noun_Project.svg/100px-Paint_palette_icon_from_the_Noun_Project.svg.png"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

end
