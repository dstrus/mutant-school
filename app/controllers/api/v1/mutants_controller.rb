class API::V1::MutantsController < API::V1::APIController
  before_action :set_mutant, only: [:show, :update, :destroy]

  # GET /mutants
  # GET /mutants.json
  def index
    @mutants = Mutant.all
  end

  # GET /mutants/1
  # GET /mutants/1.json
  def show
  end

  # POST /mutants
  # POST /mutants.json
  def create
    @mutant = Mutant.new(mutant_params)

    if @mutant.save
      render :show, status: :created, location: api_v1_mutant_url(@mutant)
    else
      render json: @mutant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mutants/1
  # PATCH/PUT /mutants/1.json
  def update
    if @mutant.update(mutant_params)
      render :show, status: :ok, location: api_v1_mutant_url(@mutant)
    else
      render json: @mutant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mutants/1
  # DELETE /mutants/1.json
  def destroy
    @mutant.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mutant
      @mutant = Mutant.includes(:advisor).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mutant_params
      params.require(:mutant).permit(
        :mutant_name,
        :power,
        :real_name,
        :eligibility_begins_at,
        :eligibility_ends_at,
        :may_advise_beginning_at
      )
    end
end
