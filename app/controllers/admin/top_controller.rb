class Admin::TopController < Admin::Base
    def index

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