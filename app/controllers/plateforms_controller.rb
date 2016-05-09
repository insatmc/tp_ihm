class PlateformsController < ApplicationController
  before_action :set_plateform, only: [:show, :edit, :update, :destroy]

  # GET /plateforms
  # GET /plateforms.json
  def index
    @plateforms = Plateform.all
  end

  # GET /plateforms/1
  # GET /plateforms/1.json
  def show
  end

  # GET /plateforms/new
  def new
    @plateform = Plateform.new
  end

  # GET /plateforms/1/edit
  def edit
  end

  # POST /plateforms
  # POST /plateforms.json
  def create
    @plateform = Plateform.new(plateform_params)

    respond_to do |format|
      if @plateform.save
        format.html { redirect_to @plateform, notice: 'Plateform was successfully created.' }
        format.json { render :show, status: :created, location: @plateform }
      else
        format.html { render :new }
        format.json { render json: @plateform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plateforms/1
  # PATCH/PUT /plateforms/1.json
  def update
    respond_to do |format|
      if @plateform.update(plateform_params)
        format.html { redirect_to @plateform, notice: 'Plateform was successfully updated.' }
        format.json { render :show, status: :ok, location: @plateform }
      else
        format.html { render :edit }
        format.json { render json: @plateform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plateforms/1
  # DELETE /plateforms/1.json
  def destroy
    @plateform.destroy
    respond_to do |format|
      format.html { redirect_to plateforms_url, notice: 'Plateform was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plateform
      @plateform = Plateform.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plateform_params
      params.require(:plateform).permit(:label)
    end
end
