class API::V1::TermsController < API::V1::APIController
  before_action :set_term, only: [:show, :update, :destroy]

  # GET /terms
  # GET /terms.json
  def index
    @terms = Term.all
  end

  # GET /terms/1
  # GET /terms/1.json
  def show
  end

  # POST /terms
  # POST /terms.json
  def create
    @term = Term.new(term_params)

    if @term.save
      render :show, status: :created, location: api_v1_term_url(@term)
    else
      render json: @term.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /terms/1
  # PATCH/PUT /terms/1.json
  def update
    if @term.update(term_params)
      render :show, status: :ok, location: api_v1_term_url(@term)
    else
      render json: @term.errors, status: :unprocessable_entity
    end
  end

  # DELETE /terms/1
  # DELETE /terms/1.json
  def destroy
    @term.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_term
      @term = Term.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def term_params
      params.require(:term).permit(:begins_at, :ends_at)
    end
end
