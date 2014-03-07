class ServicesController < ApplicationController
  before_action :set_procedure, only: [:show, :edit, :update, :destroy]

  # GET /services
  # GET /services.json
  def index
    @procedures = Service.all
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @procedure = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @procedure = Service.new(procedure_params)

    respond_to do |format|
      if @procedure.save
        format.html { redirect_to @procedure, notice: 'Service was successfully created.' }
        format.json { render action: 'show', status: :created, location: @procedure }
      else
        format.html { render action: 'new' }
        format.json { render json: @procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @procedure.update(procedure_params)
        format.html { redirect_to @procedure, notice: 'Service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @procedure.destroy
    respond_to do |format|
      format.html { redirect_to procedures_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_procedure
      @procedure = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def procedure_params
      params.require(:procedure).permit(:name, :description)
    end
end
