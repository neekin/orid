class OridsController < ApplicationController
  before_action :set_orid, only: [:show, :edit, :update, :destroy]

  # GET /orids
  # GET /orids.json
  def index
    @orids = Orid.where(public:true).order(:created_at=>'desc')
  end

  # GET /orids/1
  # GET /orids/1.json
  def show
    if current_user != @orid.user
      if !@orid.public
        flash.notice='不是公开的笔记'
        redirect_to orids_path
      end
    end

  end

  # GET /orids/new
  def new
    if !current_user
      flash.notice='请先登录'
      redirect_to login_url(callback: 'postorid')
    end
    @orid = Orid.new
  end

  # GET /orids/1/edit
  def edit
  end

  # POST /orids
  # POST /orids.json
  def create
    @orid = Orid.new(orid_params)
    respond_to do |format|
      if @orid.save
        format.html { redirect_to @orid, notice: 'Orid was successfully created.' }
        format.json { render :show, status: :created, location: @orid }
      else
        format.html { render :new }
        format.json { render json: @orid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orids/1
  # PATCH/PUT /orids/1.json
  def update
    respond_to do |format|
      if @orid.update(orid_params)
        format.html { redirect_to @orid, notice: 'Orid was successfully updated.' }
        format.json { render :show, status: :ok, location: @orid }
      else
        format.html { render :edit }
        format.json { render json: @orid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orids/1
  # DELETE /orids/1.json
  def destroy
    @orid.destroy
    respond_to do |format|
      format.html { redirect_to orids_url, notice: 'Orid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orid
      @orid = Orid.find(params[:id])
    end
    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orid_params
      params.require(:orid).permit(:o, :r, :i, :d, :user_id, :public)
    end
end
