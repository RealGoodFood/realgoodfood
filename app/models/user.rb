class User < ActiveRecord::Base
  has_many :sent_messages, :class_name => "Message", :foreign_key => "author_id"
  has_many :received_messages, :class_name => "MessageCopy", :foreign_key => "recipient_id"
  has_many :folders

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

  has_many :events
  #has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  belongs_to :group
end
