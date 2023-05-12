class PagesController < ApplicationController
    def contact_show
        @contact_form = ContactForm.new(
          email: current_user&.email
        )
    end
    
    def contact_create
        @contact_form = ContactForm.new(contact_params)
    
        if @contact_form.valid?
            ContactMailer.contact_email(@contact_form).deliver_now
            redirect_to contact_path, notice: "Your message was sent successfully."
        else
            redirect_to contact_path, alert: "Please fill in all required fields."
        end
    end
    
    private
    
    def contact_params
        params.require(:contact_form).permit(:name, :email, :question)
    end 
end
