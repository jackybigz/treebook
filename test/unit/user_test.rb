require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "a user should enter a first name" do
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?
	end

	test "a user should enter a last name" do
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?
	end

	test "a user should enter a profile name" do
		user = User.new
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "a user should have a unique profile name" do
		user = User.new
		user.profile_name = users(:jack).profile_name

		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "A user should have a profile name without spaces" do
		user = User.new(first_name: 'Jack', last_name: 'Hampson', email: 'jack_it@live.com')
		user.password = user.password_confirmation = 'adsfasdf'

		user.profile_name = "my profile name with spaces"
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end


	test " a user can have a correctly formatted profile name" do
		user = User.new(first_name: 'Jack', last_name: 'Hampson', email: 'jack_it@live.com')
		user.password = user.password_confirmation = 'adsfasdf'

		user.profile_name = 'Jhampson'
		assert user.valid?
	end
end