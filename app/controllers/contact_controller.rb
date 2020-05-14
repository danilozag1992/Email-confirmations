class ContactController < ApplicationController
  def index
    @contact = Contact.new(params[:contact])
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        @contact = Contact.new
        format.html { render 'pages/welcome' }
        format.js { flash.now[:notice] = @message = "Thank you for your message." }
      else
        format.html { render 'index' }
        format.js { flash.now[:alert] = @message = "Message did not send."}
      end
    end
  end
end
