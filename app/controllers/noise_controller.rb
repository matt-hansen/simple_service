class NoiseController < ApplicationController

  def index
    case params[:q]
    when "Ping"
      @text_to_render = "OK"
    when "Expression"
      expression = params[:d]
      # Grab the expression part of the string by taking a range from the index of the
      # first number to the index of the last number
      expression = expression[expression.index(/\d/)..expression.rindex(/\d/)]
      @text_to_render = eval(expression)
    when "Source"
      @text_to_render = "https://github.com/matt-hansen/simple_service"
    end

    @text_to_render ||= "Default Response"
    render :text => @text_to_render
  end

end
