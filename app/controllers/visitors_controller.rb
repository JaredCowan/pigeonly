class VisitorsController < ApplicationController

  def regex
    numbers = []
    body_param = params[:post][:body].gsub(/[a-zA-Z.-]/, '').strip.split(' ')

    body_param.each do |n|
      numbers.push(n.match(/\d{0,}[\d]{10,}/))
    end

    @body = numbers.compact

    respond_to do |format|
        format.js {render 'visitors/partials/regex', layout: false}
    end
  end
end
