class API::V1::MutantsController < API::V1::APIController
  before_action :set_mutant, only: [:show, :update, :destroy]

  resource_description do
    short 'Mutants'
    formats ['json']
    description 'Mutants can be students, advisors, both, or neither.'
  end

  api! 'Index all mutants'
  example 'HTTP/1.1 200 OK
Connection: close
X-Frame-Options: SAMEORIGIN
X-Xss-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Etag: W/"5645e958f697262ad59cba48b84264c6"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a41b8835-160b-451a-976e-ead11a847b6f
X-Runtime: 0.009828
Vary: Origin
X-Rack-Cors: preflight-hit; no-origin
Server: WEBrick/1.3.1 (Ruby/2.3.0/2015-12-25)
Date: Tue, 02 Feb 2016 22:20:35 GMT
Content-Length: 548
Via: 1.1 vegur

[{"id":2,"mutant_name":"Superdave","power":"Flight","real_name":"Dave","eligibility_begins_at":"2010-01-01T00:00:00.000Z","eligibility_ends_at":"2020-01-01T00:00:00.000Z","may_advise_beginning_at":"2016-01-01T00:00:00.000Z","url":"https://mutant-school.herokuapp.com/api/v1/mutants/2"},{"id":1,"mutant_name":"Jeffman","power":"Jeffing","real_name":"Jeff","eligibility_begins_at":"2010-01-01T00:00:00.000Z","eligibility_ends_at":"2020-01-01T00:00:00.000Z","may_advise_beginning_at":null,"url":"https://mutant-school.herokuapp.com/api/v1/mutants/1"}]'
  def index
    @mutants = Mutant.all
  end

  api! 'Show specific mutant'
  param :id, Fixnum, desc: 'Mutant ID (passed in URL)', required: true
  error code: 404, desc: 'Not Found - No mutant record with that ID'
  example 'HTTP/1.1 200 OK
Connection: close
X-Frame-Options: SAMEORIGIN
X-Xss-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Etag: W/"24be945c54f4c13cedc83dee7c1ad67a"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3ddc306c-0e1f-4e5e-91f1-683990774016
X-Runtime: 0.042918
Vary: Origin
X-Rack-Cors: preflight-hit; no-origin
Server: WEBrick/1.3.1 (Ruby/2.3.0/2015-12-25)
Date: Wed, 03 Feb 2016 01:33:34 GMT
Content-Length: 788
Via: 1.1 vegur

{"id":1,"mutant_name":"Fusionraptor","power":"Creating small, controlled fusion reactions","real_name":"Clarice Sloan","created_at":"2016-02-02T21:24:07.249Z","updated_at":"2016-02-02T22:23:47.482Z","eligibility_begins_at":"2010-01-01T00:00:00.000Z","eligibility_ends_at":"2020-01-01T00:00:00.000Z","may_advise_beginning_at":"2015-06-01T00:00:00.000Z","url":"https://mutant-school.herokuapp.com/api/v1/mutants/1","advisor":{"id":2,"mutant_name":"Superdave","power":"Flight","real_name":"Dave","created_at":"2016-02-02T21:24:45.964Z","updated_at":"2016-02-02T21:24:45.964Z","eligibility_begins_at":"2010-01-01T00:00:00.000Z","eligibility_ends_at":"2020-01-01T00:00:00.000Z","may_advise_beginning_at":"2016-01-01T00:00:00.000Z","url":"https://mutant-school.herokuapp.com/api/v1/mutants/2"}}'
  def show
  end

  api! 'Create mutant with specificied mutant params'
  param :mutant, Hash, desc: 'Mutant information', required: true do
    param :real_name, String, desc: 'Legal name', required: true
    param :mutant_name, String, desc: 'Preferred name', required: true
    param :power, String, desc: 'Superpower', required: true
    param :eligibility_begins_at, String, desc: 'Date when eligibility to enroll begins'
    param :eligibility_ends_at, String, desc: 'Date when mutant is no longer eligible to enroll'
    param :may_advise_beginning_at, String, desc: 'Mutant may be an advisor to students on or after this date.'
  end
  def create
    @mutant = Mutant.new(mutant_params)

    if @mutant.save
      render :show, status: :created, location: api_v1_mutant_url(@mutant)
    else
      render json: @mutant.errors, status: :unprocessable_entity
    end
  end

  api! 'Update specific mutant'
  param :id, Fixnum, desc: 'Mutant ID (passed in URL)', required: true
  error code: 404, desc: 'Not Found - No mutant record with that ID'
  def update
    if @mutant.update(mutant_params)
      render :show, status: :ok, location: api_v1_mutant_url(@mutant)
    else
      render json: @mutant.errors, status: :unprocessable_entity
    end
  end

  api! 'Delete specific mutant'
  param :id, Fixnum, desc: 'Mutant ID (passed in URL)', required: true
  error code: 404, desc: 'Not Found - No mutant record with that ID'
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
