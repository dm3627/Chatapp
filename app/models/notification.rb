class Notification < ApplicationRecord
	# after_create_commit { NotificationBroadcastJob.perform_later self }
	after_create_commit  { broadcastNotification self }

	private

	def broadcastNotification message
		ActionCable.server.broadcast 'notification_channel', message: render_message(message)
	end

	def render_message(message)
    ApplicationController.renderer.render(partial: 'notifications/notification', locals: { notification: message })
  end
end