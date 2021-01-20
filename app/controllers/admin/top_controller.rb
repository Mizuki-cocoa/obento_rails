class Admin::TopController < Admin::Base
    layout "admin"

    private def admin_login_required
        raise LoginRequired unless current_admin
    end

    def index
      @admins = Admin.order("id")
    end
    
    def bad_request
        raise ActionController::ParameterMissing, ""
    end
    
    def forbidden
        raise Forbidden, ""
    end

    def internal_server_error
        raise
    end
end