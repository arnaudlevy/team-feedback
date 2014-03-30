class IndicatorsController < ApplicationController
  before_action :set_indicator, only: [:show, :edit, :update, :destroy]

  # GET /indicators
  def index
    @indicators = Indicator.all
  end

  # GET /indicators/1
  def show
  end

  # GET /indicators/new
  def new
    @indicator = Indicator.new
  end

  # GET /indicators/1/edit
  def edit
  end

  # POST /indicators
  def create
    @indicator = Indicator.new(indicator_params)
    if @indicator.save
      redirect_to @indicator, notice: 'Indicator was successfully created.'
    else
      render action: 'new'
    end
    end
  end

  # PATCH/PUT /indicators/1
  def update
    if @indicator.update(indicator_params)
      redirect_to @indicator, notice: 'Indicator was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /indicators/1
  def destroy
    @indicator.destroy
    redirect_to indicators_url
  end

  private
    def set_indicator
      @indicator = Indicator.find(params[:id])
    end
    def indicator_params
      params.require(:indicator).permit(:label)
    end
end
