module ApplicationHelper
  def gravatar_for(user, opts = {})
    opts[:alt] = user.name
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=#{opts.delete(:size) { 40 }}",
              opts
  end


  def recupera_imagen
    puts '-----------------------'
    puts '-----------------------'
    if user_signed_in?
      '/assets/background_entrada.jpg'
    else
      '/assets/img-1.jpg'
    end
  end

end
