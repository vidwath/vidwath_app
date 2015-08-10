class UsersController < ApplicationController
	def index
		@user= User.all
	end
	def new
		@user = User.new	
	end
	def create
		# binding.pry
		@user = User.new(:firstname=>params[:user][:firstname],:lastname=>params[:user][:lastname],:designation=>params[:user][:designation],:place=>params[:user][:place])
		if@user.valid?&&@user.errors.blank?
		@user.save
		redirect_to user_path(@user)
	else
		render 'new'
	end
	end
	def show
		@user = User.find(params[:id])
	end
end
