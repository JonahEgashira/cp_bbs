#https://prog-8.comを参考にしました
class HomeController < ApplicationController
  before_action :forbid_login_user, {only: [:top]}
  def top
  end
  
  def about
  end
end
