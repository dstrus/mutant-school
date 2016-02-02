class API::V1::AdviseesController < API::V1::APIController
  before_action :set_advisor

  def index
    @advisees = @advisor.advisees
  end

  def create
    @mutant = Mutant.find params[:advisee][:id]

    if @mutant.update advisor: @advisor
      render 'api/v1/mutants/show', status: :created, location: api_v1_mutant_url(@mutant)
    else
      render json: @mutant.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @mutant = @advisor.advisees.find params[:id]
    if @mutant.update advisor_id: nil
      render 'api/v1/mutants/show', status: :ok, location: api_v1_mutant_url(@mutant)
    else
      render json: @mutant.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advisor
      @advisor = Mutant.find(params[:mutant_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advisee_params
      params.require(:advisee).permit :id
    end
end
