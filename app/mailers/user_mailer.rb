class UserMailer < ApplicationMailer

  def status_email(spot, user)
    @spot = spot
    @user = user
    @name = @spot.user.name
    @email = @spot.user.email
    mail to: @email, cc: "dravel.check@gmail.com", subject: '申請完了のお知らせ'
  end

  def approval_email(spot, user)
    @spot = spot
    @user = user
    @name = @spot.user.name
    @email = @spot.user.email
    mail to: @email, subject: '審査完了のお知らせ'
  end

  def rejected_email(spot, user)
    @spot = spot
    @user = user
    @name = @spot.user.name
    @email = @spot.user.email
    mail to: @email, subject: '審査完了のお知らせ'
  end
  
  def contact_email(contact, user)
    @contact = contact
    @user = user
    @name = @contact.user.name
    @email = @contact.user.email
    mail to: @email, cc: "dravel.check@gmail.com", subject: 'お問合せを受け付けました'
  end
  
  def update_email(contact, user)
    @contact = contact
    @user = user
    @name = @contact.user.name
    @email = @contact.user.email
    mail to: @email, subject: '先日のお問合せ内容の回答'
  end
  
end