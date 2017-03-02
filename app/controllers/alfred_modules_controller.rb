class AlfredModulesController < ApplicationController
  include AlfredModulesHelper

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_alfred_module, only: [:show, :edit, :update, :destroy]
  before_action :check_ownership, only: [:update, :destroy, :edit]

  # GET /alfred_modules
  # GET /alfred_modules.json
  def index
    @alfred_modules = AlfredModule.all
  end

  # GET /alfred_modules/1
  # GET /alfred_modules/1.json
  def show
  end

  # GET /alfred_modules/new
  def new
    @alfred_module = AlfredModule.new
  end

  # GET /alfred_modules/1/edit
  def edit
  end

  # POST /alfred_modules
  # POST /alfred_modules.json
  def create
    @alfred_module = AlfredModule.new(alfred_module_params)
    @alfred_module.user = current_user

    respond_to do |format|
      if @alfred_module.save
        format.html { redirect_to @alfred_module, notice: 'Alfred module was successfully created.' }
        format.json { render :show, status: :created, location: @alfred_module }
      else
        format.html { render :new }
        format.json { render json: @alfred_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alfred_modules/1
  # PATCH/PUT /alfred_modules/1.json
  def update
    respond_to do |format|
      if @alfred_module.update(alfred_module_params)
        format.html { redirect_to @alfred_module, notice: 'Alfred module was successfully updated.' }
        format.json { render :show, status: :ok, location: @alfred_module }
      else
        format.html { render :edit }
        format.json { render json: @alfred_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alfred_modules/1
  # DELETE /alfred_modules/1.json
  def destroy
    @alfred_module.destroy
    respond_to do |format|
      format.html { redirect_to alfred_modules_url, notice: 'Alfred module was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def check_ownership
      unless can_edit?(@alfred_module)
        redirect_to @alfred_module, notice: 'Not Your module!, Go create one'
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_alfred_module
      @alfred_module = AlfredModule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alfred_module_params
      params.require(:alfred_module).permit(:name, :license, :homepage, :description)
    end
end
