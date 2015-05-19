class UsersController < ApplicationController

      before_action :set_user, only: [:show, :update, :destroy]


  		# GET
  		# =================================================
  		# =================================================
  		def index

        @users = User.find_by_sql Tools.query(params)

  			render json: @users,root: :users

  		end
  		# =================================================
  		# =================================================


  		# GET
  		# =================================================
  		# =================================================
  		def show

  			render json: @user

  		end
  		# =================================================
  		# =================================================


  		# PUT
  		# =================================================
  		# =================================================
  		def update

        if @user.update(user_params)

          render json: @user,status: 200

        else

          render json: {error: true,errors: @user.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================


  		# POST
  		# =================================================
  		# =================================================
  		def create

  			@user = User.new user_params

  			if @user.save

  				render json: @user,status: 201

  			else

  				render json: {error: true,errors: @user.errors},status: :unprocessable_entity

  			end

  		end
  		# =================================================
  		# =================================================


  		# DELETE
  		# =================================================
  		# =================================================
  		def destroy

        if @user.destroy

          render json: {user: {id: params[:id].to_i}},status: 200

        else

          render json: {error: true,errors: @user.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find params[:id]
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit :email, :password, :password_confirmation, :created_at, :updated_at
      end

  	end