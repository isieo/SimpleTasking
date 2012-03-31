class Columns::Answer
  include Mongoid::Document
  field :flag, :type => Integer, :default=> 0
  field :task_id, :type => String

  belongs_to :user
  embedded_in :column

  def image
    image_loc = '/assets/uncheck.png'
    case flag
    when 0
      image_loc = '/assets/uncheck.png'
    when 1
      image_loc = '/assets/check.jpg'
    when 2
      image_loc = '/assets/na.png'
    end
    image_loc
  end
end
