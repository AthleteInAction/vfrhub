class User < ActiveRecord::Base

	has_secure_password

	attr_accessible :email, :password, :password_confirmation, :created_at, :updated_at

	validates_presence_of :email
	validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

end