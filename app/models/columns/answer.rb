class Columns::Answer
  include Mongoid::Document
  field :flag, :type => Integer, :default=> 0
  field :task_id, :type => String

  belongs_to :user
  embedded_in :column
end
