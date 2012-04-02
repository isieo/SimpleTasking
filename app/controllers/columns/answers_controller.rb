class Columns::AnswersController < ApplicationController
  before_filter :load_column
  def update
    @columns_answer = @column.answers.find(params[:id])
    @columns_answer.flag = params[:flag]
    @columns_answer.flag = 0 if !@columns_answer.flag || @columns_answer.flag > 2 || @columns_answer.flag <0
    @columns_answer.save

    render :json=>@columns_answer.image
  end

  def load_column
    @column = Column.find(params[:column_id])
  end
end
