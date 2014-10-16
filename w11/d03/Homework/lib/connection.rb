require "active_record"

require_relative "./account.rb"

ActiveRecord::Base.establish_connection({
	:adapter => "postgresql",
	:host => "localhost",
	:username => "Trish",
	:database => "bank_app"
	})