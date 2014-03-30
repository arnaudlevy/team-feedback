class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :set_indicators

  # GET /teams
  def index
    @teams = Team.all
  end

  # GET /teams/1
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team, notice: 'team was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /teams/1
  def update
      if @team.update(team_params)
        redirect_to @team, notice: 'Team was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /teams/1
  def destroy
    @team.destroy
    redirect_to teams_url
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end
    def set_indicators
      @indicators = Indicator.all
    end
    def team_params
      params.require(:team).permit(:label)
    end
end
