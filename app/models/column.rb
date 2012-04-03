class Column
  include Mongoid::Document
  field :name, :type => String
  field :pos, :type => Integer
  field :private, :type => Boolean, :default => false
  include ActsAsList::Mongoid 
  acts_as_list :column => :pos
  
  
  belongs_to :checklist
  belongs_to :user
  embeds_many :answers, :class_name => 'Columns::Answer'

  named_scope :for_user, lambda {|user| where(user_id: user.id) }


end
