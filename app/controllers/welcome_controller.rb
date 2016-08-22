class WelcomeController < ApplicationController
  def index
    if ContentfulUser.count >= 1
      @contentful_user = ContentfulUser.first
      redirect_to contentful_user_path(@contentful_user) if @contentful_user.complete?
    end
  end
end
