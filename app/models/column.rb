class Column
  include Mongoid::Document
  field :name, :type => String
  field :pos, :type => String

  belongs_to :checklist
  embeds_many :answers, :class_name => 'Columns::Answer'


end
