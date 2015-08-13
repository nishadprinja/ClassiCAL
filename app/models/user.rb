class User < ActiveRecord::Base

	has_one :major, class_name: 'Department', foreign_key: 'major_id'
	has_one :minor, class_name: 'Department', foreign_key: 'minor_id'

	validates :username, presence: true, uniqueness: true
 	has_secure_password
end
