class API::V1::EnrollmentsController < API::V1::APIController
  before_action :set_parent

  # GET /enrollments
  # GET /enrollments.json
  def index
    @enrollments = @parent.enrollments.all
  end

  # GET /enrollments/1
  # GET /enrollments/1.json
  def show
  end

  # POST /enrollments
  # POST /enrollments.json
  def create
    @enrollment = @parent.enrollments.build enrollment_params
      if @enrollment.save
        render :show, status: :created, location: api_v1_mutant_enrollment_url(@mutant, @enrollment)
      else
        render json: @enrollment.errors, status: :unprocessable_entity
      end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    @enrollment.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @parent = Mutant.find params[:mutant_id] if params[:mutant_id]
      @parent = Term.find params[:term_id] if params[:term_id]
      set_enrollment if params[:action].in? ['show', 'destroy']
    end

    def set_enrollment
      @enrollment = @parent.enrollments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrollment_params
      params.require(:enrollment).permit(:term_id, :mutant_id)
    end
end
