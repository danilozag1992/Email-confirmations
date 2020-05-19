class ContactController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
      if @contact.deliver
        flash.now[:alert] = nil
      else
        flash.now[:alert] = "Can not send message!"
        render 'new'
      end
    end
  end
