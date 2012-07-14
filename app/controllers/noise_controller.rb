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
    when "Email Address"
      @text_to_render = "matt.j.hansen@gmail.com"
    when "Phone"
      @text_to_render = "541-224-3842"
    when "Full Name"
      @text_to_render = "Matthew J Hansen"
    when "Years"
      @text_to_render = 9
    when "Degree"
      @text_to_render = "Bachelors of Business Administration with Emphasis in Computer Information Systems from Idaho State University"
    when "Position"
      @text_to_render = "Sr. Web Applications Developer"
    end

    @text_to_render ||= "Default Response"
    render :text => @text_to_render
  end

end
