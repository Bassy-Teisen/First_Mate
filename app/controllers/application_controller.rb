class ApplicationController < ActionController::Base
    include Pundit  

    rescue_from Pundit::NotAuthorizedError, with: :forbidden

    private

    def forbidden
        flash[:alert] = "Not Authorized to do action!!!"
        redirect_to(request.referrer || root_path)
    end
end
