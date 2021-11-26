class ApplicationController < ActionController::Base
    include Pundit  
    
    # This impliments the cutomized alert message 
    rescue_from Pundit::NotAuthorizedError, with: :forbidden

    private

    # This creates a message for a custom message for the Pundit::NotAuthorizedError alert
    def forbidden
        flash[:alert] = "Not Authorized to do action!!!"
        redirect_to(request.referrer || root_path)
    end
end
