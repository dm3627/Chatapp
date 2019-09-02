class NotificationsController < ApplicationController
	def show
		@notifications = Notification.all
	end
end