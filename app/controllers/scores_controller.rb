class ScoresController < ApplicationController

  private

  def score_params
    params.require(:score).permit(
      :case_id,
      :staff_id,
      :point,
    )
  end

end