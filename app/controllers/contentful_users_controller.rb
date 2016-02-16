class ContentfulUsersController < ApplicationController
  before_action :set_contentful_user, only: [:show, :edit, :update, :destroy]

  # GET /contentful_users
  # GET /contentful_users.json
  def index
    @contentful_users = ContentfulUser.all
  end

  # GET /contentful_users/1
  # GET /contentful_users/1.json
  def show
  end

  # GET /contentful_users/new
  def new
    @contentful_user = ContentfulUser.new
  end

  # GET /contentful_users/1/edit
  def edit
  end

  # POST /contentful_users
  # POST /contentful_users.json
  def create
    @contentful_user = ContentfulUser.new(contentful_user_params)

    respond_to do |format|
      if @contentful_user.save
        format.html { redirect_to @contentful_user, notice: 'Contentful user was successfully created.' }
        format.json { render :show, status: :created, location: @contentful_user }
      else
        format.html { render :new }
        format.json { render json: @contentful_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contentful_users/1
  # PATCH/PUT /contentful_users/1.json
  def update
    respond_to do |format|
      if @contentful_user.update(contentful_user_params)
        format.html { redirect_to @contentful_user, notice: 'Contentful user was successfully updated.' }
        format.json { render :show, status: :ok, location: @contentful_user }
      else
        format.html { render :edit }
        format.json { render json: @contentful_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contentful_users/1
  # DELETE /contentful_users/1.json
  def destroy
    @contentful_user.destroy
    respond_to do |format|
      format.html { redirect_to contentful_users_url, notice: 'Contentful user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contentful_user
      @contentful_user = ContentfulUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contentful_user_params
      params.require(:contentful_user).permit(:name, :space_id, :access_token, :content_type)
    end
end
