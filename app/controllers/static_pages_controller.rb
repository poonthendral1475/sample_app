class StaticPagesController < ApplicationController
  def home
    @name="poonthendral"
    @time=Time.now
  end

  def help
  end

  def about
  end

  def contact
  end
end
