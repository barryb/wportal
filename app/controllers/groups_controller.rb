class GroupsController < ApplicationController

  before_filter :signed_in_user
  before_filter :admin_user
  
  def show
    @group = Group.find(params[:id])
  end
  
  def index
    @groups = Group.paginate(page: params[:page])
  end
  
  def new
  	@group = Group.new
  end
  
  def create
    @group = Group.new(params[:group])
    if @group.save
      flash[:success] = "Group Created"
      redirect_to @group
    else
      render 'new'
    end
  end 
  
  def edit
    @group = Group.find(params[:id])
  end
  
  def update
   @group = Group.find(params[:id])
    if @group.update_attributes(params[:group])
      flash[:success] = "Group updated"
  #    sign_in @user
      redirect_to @group
    else
      render 'edit'
    end
  end
  
  private
  
  	def admin_user
  	  unless current_user.admin?
  	  	flash[:error] = 'You need to be an admin to do that!'
   		sign_out
   		redirect_to root_path
      end
  	end
end
