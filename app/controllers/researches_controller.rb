class ResearchesController < ApplicationController
	
	def new
    @research = Research.new
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

  def destroy
    @research = Research.find(params[:id])
    @research.destroy
 
    redirect_to researches_path         
  end

  private
    def research_params
    params.require(:research).permit(:name, :period_of_execution, :cost)
  end
end
