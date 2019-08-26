class LeaguesController < ApplicationController
  before_action :set_league, only: [:show, :edit, :update, :destroy]

  def index
    @leagues = current_user.leagues
  end

  def show
  end

  def create
    @league = current_user.leagues.new(league_params)
    if @league.save
      flash[:success] = "League Created"
      redirect_to leagues_path
    else
      flash[:error] = "Error #{@league.errors.full_messages.join("\n")}"
      render :new
    end
  end

  def new
    @league = League.new
  end

  def edit
  end
  
  def update
    if @league.update(league_params)
      redirect_to leagues_path
    else
      render :edit
    end
  end

  def destroy
    @league.destroy 
    redirect to leagues_path
  end
private
    def league_params
      params.require(:league).permit(:name, :character)
    end

    def set_league
      @league = current_user.leagues.find(params[:id])
    end


end
