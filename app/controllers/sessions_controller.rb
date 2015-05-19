class SessionsController < ApplicationController

	skip_before_filter :authorize,:api_authorize

	def new

		render 'login',layout: 'splash'

	end

	def create

		user = User.find_by_email params[:email]

		if user && !user.floating && user.authenticate(params[:password])

			session[:user_id] = user.id

			redirect_to root_url, flash: {success: "Welcome #{params[:email]}!"}

		else

			# @email = params[:email]

			flash[:danger] = 'Email or password is invalid'

			render 'login',layout: 'splash'

			flash.delete :danger

		end

	end

	def destory

		session.delete :user_id

		reset_session if params[:reset] == 'true'

		redirect_to root_url, flash: {warning: 'You have been logged out!'}

	end

	private
	def user_params
		params.require(:user).permit plist
	end

	def plist
		[:password_confirmation,:password,:token]
    end

end