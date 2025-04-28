class StaticPagesController < ApplicationController
  def home
    @name="kutty"
    @arr=[39,34,543,1,2,-7,-3]
    @time=Time.now
  end

  def help
  end

  def about
  end

  def contact
  end
end
