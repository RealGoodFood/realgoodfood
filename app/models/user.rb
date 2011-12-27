class User < ActiveRecord::Base
  has_many   :events
  belongs_to :group
  has_many   :sent_messages, :class_name => "Message", :foreign_key => "author_id"
  has_many   :received_messages, :class_name => "MessageCopy", :foreign_key => "recipient_id"
  has_many   :folders
  has_one    :profile

  before_create :build_inbox

  def inbox
    folders.find_by_name("Inbox")
  end

  def build_inbox
    folders.build(:name => "Inbox")
  end


  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :group_id

end
