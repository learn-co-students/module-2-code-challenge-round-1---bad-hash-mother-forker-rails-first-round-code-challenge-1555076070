class HeroinesController < ApplicationController
  def index
    if params[:query]
      @powers = Power.where("name LIKE ?", "%#{params[:query]}%")
      heroines = []
      @powers.each do |power|
        power.heroines.each do |hero|
          heroines << hero
        end
      end
      @heroines = heroines
    else
      @heroines = Heroine.all
    end
    # @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to heroine_path(@heroine)
    else
      render :new
    end
  end

  private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
