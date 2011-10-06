class Folder < ActiveRecord::Base
  acts_as_nested_set
  belongs_to :user
  has_many :messages, :class_name => "MessageCopy"
end
