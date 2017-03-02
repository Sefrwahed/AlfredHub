class VersionsController < ApplicationController
  include AlfredModulesHelper

  before_action :authenticate_user!, except: [:download]
  before_action :set_alfred_module
  before_action :set_version, only: [:destroy, :download]
  before_action :check_ownership, except: [:download]

  # GET /versions/new
  def new
    @version = Version.new
  end

  # POST /versions
  # POST /versions.json
  def create
    @version = Version.new(version_params)
    @version.alfred_module = @a_module

    respond_to do |format|
      if @version.save
        format.html { redirect_to @a_module, notice: 'Version was successfully created.' }
        format.json { render :show, status: :created, location: @version }
      else
        format.html { render :new }
        format.json { render json: @version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /versions/1
  # DELETE /versions/1.json
  def destroy
    @version.destroy
    respond_to do |format|
      format.html { redirect_to alfred_module_url(@a_module), notice: 'Version was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download
    file_path = @version.fetch_from_storage
    send_file(file_path)
  end

  private

    def check_ownership
      unless can_edit?(@a_module)
        redirect_to @a_module, notice: 'Not authorized'
      end
    end

    def set_version
      @version = Version.find(params[:id])
    end

    def set_alfred_module
      @a_module = AlfredModule.find(params[:alfred_module_id])
    end

    def version_params
      params.require(:version).permit(:number, :uploaded_file)
    end
end
