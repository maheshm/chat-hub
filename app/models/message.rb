class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :reciever, class_name: 'User'

  def self.all_messages_of(sender, reciever)
    where(sender: sender, reciever: reciever)
      .or(where(reciever: sender, sender: reciever))
  end
end
