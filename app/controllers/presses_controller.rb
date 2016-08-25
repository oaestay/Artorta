class PressesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_press, only: [:show, :edit, :update, :destroy]

  # GET /presses
  # GET /presses.json
  def index
    @presses = Press.all.order("popularity desc").paginate(page: params[:page], per_page: 24)
  end

  # GET /presses/1
  # GET /presses/1.json
  def show
    @press.popularity += 1
    @press.save
    respond_to do |format|
      format.html # show.html.erb
      format.js # show.js.erb
    end
  end

  # GET /presses/new
  def new
    @press = Press.new
  end

  # GET /presses/1/edit
  def edit
  end

  # POST /presses
  # POST /presses.json
  def create
    @press = Press.new(press_params)

    respond_to do |format|
      if @press.save
        format.html { redirect_to @press, notice: 'Press was successfully created.' }
        format.json { render :show, status: :created, location: @press }
      else
        format.html { render :new }
        format.json { render json: @press.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presses/1
  # PATCH/PUT /presses/1.json
  def update
    respond_to do |format|
      if @press.update(press_params)
        format.html { redirect_to @press, notice: 'Press was successfully updated.' }
        format.json { render :show, status: :ok, location: @press }
      else
        format.html { render :edit }
        format.json { render json: @press.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presses/1
  # DELETE /presses/1.json
  def destroy
    @press.destroy
    respond_to do |format|
      format.html { redirect_to presses_url, notice: 'Press was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_press
      @press = Press.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def press_params
      params.require(:press).permit(:name, :popularity, :image)
    end
end