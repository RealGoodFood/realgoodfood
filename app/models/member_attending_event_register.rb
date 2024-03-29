class MemberAttendingEventRegister < ActiveRecord::Base
 attr_accessible :user_id, :event_id, :owner_id, :state

 belongs_to :event
 belongs_to :user

 validates :user_id, :uniqueness => {:scope => :event_id}

include Workflow

workflow_column :state

workflow do
   state :request_sent do
     event :accept, :transitions_to => :accepted
     event :reject, :transitions_to => :rejected
   end
   state :accepted
   state :rejected
 end

end
