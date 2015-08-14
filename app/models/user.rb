class User < ActiveRecord::Base

	validates :first_name, presence: true, uniqueness: true
	validates :last_name, presence: true, uniqueness: true
	validates :username, presence: true, uniqueness: true
	validates :graduation_year, presence: true

 	has_secure_password

 	has_one :major, class_name: 'Department', foreign_key: 'major_id'
	has_one :minor, class_name: 'Department', foreign_key: 'minor_id'
end
