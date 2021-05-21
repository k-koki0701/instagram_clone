class BlogMailer < ApplicationMailer
  def blog_mail(blog)
    @blog = blog
    mail to: "k.koki980701@gmail.com", subject: "投稿の確認メール"
  end
end
