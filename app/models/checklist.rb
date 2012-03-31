class Checklist
  include Mongoid::Document
  field :name, :type => String
  field :description, :type => String
  field :private, :type => Boolean, :default => false

  named_scope :for_user, lambda {|user| where(user_id: user.id) }

  named_scope :viewable_for, lambda {|user| any_of({:user_id => user.id},{:private.ne => true}) }

  belongs_to :user
  embeds_many :tasks, :class_name => "Checklists::Task"
  has_many :columns

  def can_modified_by(current_user)
    if user == current_user
      return true
    else
      #todo: group logic
      return false
    end
  end
end
