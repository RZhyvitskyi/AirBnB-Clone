class PagesController < ApplicationController
<<<<<<< HEAD
=======
  skip_before_action :authenticate_user!, only: [:home, :about]

>>>>>>> 35c36aba46a61d0f730f4e215e16cd8e6ba687cb
  def home
  end

  def about
  end
end
