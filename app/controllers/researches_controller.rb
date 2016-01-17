class ResearchesController < ApplicationController
	
	def new
  end

  def show
  	@research = Research.find(params[:id])  	
  end

	def index
		@researches = Research.all
	end

	def create
  	@research = Research.new(research_params)
 
  	@research.save
  	redirect_to @research
  end

  private
    def research_params
    params.require(:research).permit(:name, :period_of_execution, :cost)
  end
end
