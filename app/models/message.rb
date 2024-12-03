class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :sender, class_name: "User", foreign_key: 'user_id'

  validates :content, presence: true

  #Ensures the sender is a participant of the chatroom
  validates :sender, inclusion: {
    in: ->(message) { [message.chatroom.user_1, message.chatroom.user_2] },
    message: "must be a participant of the chatroom"
  }

  #The broadcasting logic ensures messages are sent to both participants.
  after_create_commit -> {
    broadcast_append_to chatroom,
                       partial: "messages/message",
                       locals: { message: self, user: sender },
                       target: "messages"
  }

  #Returns the other user in the chatroom
  def receiver
    chatroom.other_user(sender)
  end

  #Checks if the user is the sender of the message
  def sender?(user)
    sender == user
  end
end
