class AccountController < ApplicationController

  def authenticate
    self.logged_in_user = User.authenticate(params[:user][:username], params[:user][:password])

    if is_logged_in?
      flash[:notice]="你登陆成功"
      redirect_to index_url
    else
      flash[:error] ="您的用户名或密码错误!"
      render :action => 'login'
    end
  end

  def logout
    if request.post?
      reset_session
      flash[:notice]="你已经登出"
    end
    redirect_to index_url
  end

end
