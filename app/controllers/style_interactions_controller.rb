class StyleInteractionsController < ApplicationController
  before_action :set_style_interaction, only: [:show, :edit, :update, :destroy]

  # GET /style_interactions
  # GET /style_interactions.json
  def index
    @style_interactions = StyleInteraction.all
  end

  # GET /style_interactions/1
  # GET /style_interactions/1.json
  def show
  end

  # GET /style_interactions/new
  def new
    @style_interaction = StyleInteraction.new
  end

  # GET /style_interactions/1/edit
  def edit
  end

  # POST /style_interactions
  # POST /style_interactions.json
  def create
    @style_interaction = StyleInteraction.new(style_interaction_params)

    respond_to do |format|
      if @style_interaction.save
        format.html { redirect_to @style_interaction, notice: 'Style interaction was successfully created.' }
        format.json { render :show, status: :created, location: @style_interaction }
      else
        format.html { render :new }
        format.json { render json: @style_interaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /style_interactions/1
  # PATCH/PUT /style_interactions/1.json
  def update
    respond_to do |format|
      if @style_interaction.update(style_interaction_params)
        format.html { redirect_to @style_interaction, notice: 'Style interaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @style_interaction }
      else
        format.html { render :edit }
        format.json { render json: @style_interaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /style_interactions/1
  # DELETE /style_interactions/1.json
  def destroy
    @style_interaction.destroy
    respond_to do |format|
      format.html { redirect_to style_interactions_url, notice: 'Style interaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_style_interaction
      @style_interaction = StyleInteraction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def style_interaction_params
      params.require(:style_interaction).permit(:label)
    end
end
