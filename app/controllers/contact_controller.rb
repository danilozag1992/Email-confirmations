class ContactController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
      if @contact.deliver
        flash[:notice] = "Successfully sent email!"
        redirect_to root_path
      else
        flash.now[:alert] = "Can not send Message!"
        render 'new'
      end
  end

  def message

  end
end


