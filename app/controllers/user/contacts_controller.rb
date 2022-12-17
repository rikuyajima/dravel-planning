class User::ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    if @contact.save
      UserMailer.contact_email(@contact, @user).deliver
      flash[:notice] = "お問合せ内容を送信しました。回答はメールでお送りします。"
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def update
    @contact = Contact.find(params[:id])
    @user = @contact.user
    if @contact.update(contact_params)
      UserMailer.update_email(@contact, @user).deliver
      flash[:notice] = "情報を更新しました。"
       redirect_to admin_contacts_path
    else
       render :edit
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
      flash[:notice] = "削除しました。"
      redirect_to '/admin/contacts'
  end

  private

  def contact_params
    params.require(:contact).permit(:kinds, :subject, :contact_status, :message)
  end
end
