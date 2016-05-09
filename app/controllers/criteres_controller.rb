class CriteresController < ApplicationController
  before_action :set_critere, only: [:show, :edit, :update, :destroy]

  # GET /criteres
  # GET /criteres.json
  def index
    @criteres = Critere.all
  end

  # GET /criteres/1
  # GET /criteres/1.json
  def show
  end

  # GET /criteres/new
  def new
    @critere = Critere.new
  end

  # GET /criteres/1/edit
  def edit
  end

  # POST /criteres
  # POST /criteres.json
  def create
    @critere = Critere.new(critere_params)
    @plateform = Plateform.find(params[:plateform])
    @domaine = Domaine.find(params[:domaine])
    @style_interaction = StyleInteraction.find(params[:style_interaction])
    @critere.plateforms << @plateform
    @critere.domaines << @domaine
    @critere.style_interactions << @style_interaction

    respond_to do |format|
      if @critere.save
        format.html { redirect_to @critere, notice: 'Critere was successfully created.' }
        format.json { render :show, status: :created, location: @critere }
      else
        format.html { render :new }
        format.json { render json: @critere.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /criteres/1
  # PATCH/PUT /criteres/1.json
  def update
    respond_to do |format|
      if @critere.update(critere_params)
        format.html { redirect_to @critere, notice: 'Critere was successfully updated.' }
        format.json { render :show, status: :ok, location: @critere }
      else
        format.html { render :edit }
        format.json { render json: @critere.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /criteres/1
  # DELETE /criteres/1.json
  def destroy
    @critere.destroy
    respond_to do |format|
      format.html { redirect_to criteres_url, notice: 'Critere was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_critere
      @critere = Critere.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def critere_params
      params.require(:critere).permit(:label, :auteur_id, :catogrie_id)
    end
end
