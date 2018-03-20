module UsersHelper
  def gravatar_for(user, size: 50)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: gravatar_alt_text(user.name), class: "gravatar")
  end

  private

  def gravatar_alt_text(name)
    "#{name} gravatar profile picture"
  end
end
