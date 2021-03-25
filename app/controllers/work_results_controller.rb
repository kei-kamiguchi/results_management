class WorkResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_work_result, only: %i[ show edit update destroy ]

  # GET /work_results or /work_results.json
  def index
    @work_results = WorkResult.all
  end

  # GET /work_results/1 or /work_results/1.json
  def show
    @time_card = @work_result.time_card
  end

  # GET /work_results/1/edit
  def edit
  end

  # PATCH/PUT /work_results/1 or /work_results/1.json
  def update
    if @work_result.update(work_result_params)
      redirect_to new_time_card_path
    else
      render :edit
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
      params.require(:work_result).permit(:writing, :revision, :time_card_id, :user_id)
    end
end
