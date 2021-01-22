class AdminAccountController < ApplicationController
    before_action :admin_login_required
end
