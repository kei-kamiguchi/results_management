class WorkResultsController < ApplicationController
  before_action :set_work_result, only: %i[ show edit update destroy ]

  # GET /work_results or /work_results.json
  def index
    @work_results = WorkResult.all
  end

  # GET /work_results/1 or /work_results/1.json
  def show
    @time_card = @work_result.time_card
  end

  # GET /work_results/new
  def new
    @work_result = WorkResult.new
    @time_card = TimeCard.find(params[:time_card_id])
  end

  # GET /work_results/1/edit
  def edit
  end

  # POST /work_results or /work_results.json
  def create
    @work_result = WorkResult.new(work_result_params)

    respond_to do |format|
      if @work_result.save
        format.html { redirect_to @work_result, notice: "Work result was successfully created." }
        format.json { render :show, status: :created, location: @work_result }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @work_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_results/1 or /work_results/1.json
  def update
    respond_to do |format|
      if @work_result.update(work_result_params)
        format.html { redirect_to @work_result, notice: "Work result was successfully updated." }
        format.json { render :show, status: :ok, location: @work_result }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @work_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_results/1 or /work_results/1.json
  def destroy
    @work_result.destroy
    respond_to do |format|
      format.html { redirect_to work_results_url, notice: "Work result was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_result
      @work_result = WorkResult.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_result_params
      params.require(:work_result).permit(:writing, :revision, :time_card_id)
    end
end
