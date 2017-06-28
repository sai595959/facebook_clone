module ApplicationHelper

  def post_photo(post)
    image_tag(post.photo, class: 'photo_index')
  end

  def confirm_photo(post)
    image_tag(post.photo.url, class: 'photo_confirm')
  end
  
  def profile_img(user,page)

    #return image_tag(user.avatar, alt: user.name) if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      if user.avatar.blank?
        img_url = 'no_image.png'
      else
        img_url = user.avatar
      end
    end

    if page == 'topic'
      img_cls = 'topic_profile_img'
    elsif page == 'header'
      img_cls = 'header_profile_img'
    elsif page == :user_index
      img_cls = 'user_index_img'

    else
      img_cls = 'profile_img'
    end

    image_tag(img_url, alt: user.name, class:img_cls )
  end
end
