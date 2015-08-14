module ApplicationHelper
  # mms: I think this is the first helper I have seen from a student.  Great use for a helper.  :high_five:
  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    if user.image
      user.image
    else
      "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?=identicon&s=50"
    end
  end
end
