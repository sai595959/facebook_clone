module ApplicationHelper
  def profile_img(user,page)
    return image_tag(user.avatar, alt: user.name) if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end

    if page == 'topic'
      img_cls = 'topic_profile_img'
    else
      img_cls = 'profile_img'
    end

    image_tag(img_url, alt: user.name, class:img_cls )
  end
end
