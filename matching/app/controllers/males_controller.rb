class MalesController < ApplicationController
  before_action :set_male, only: [:show, :edit, :update, :destroy]

  # GET /males
  # GET /males.json
  def index
    @males = Male.all
  end

  # GET /males/1
  # GET /males/1.json
  def show
  end

  # GET /males/new
  def new
    @male = Male.new
  end

  # GET /males/1/edit
  def edit
  end

  # POST /males
  # POST /males.json
  def create
    @male = Male.new(male_params)

    @hobbys = params[:male][:hobbys].split(",")
    @hobbys2 = []
    @hobbys.each do |h|
      @hobbys2.append(h)
    end

    @male.hobbys = @hobbys2


    respond_to do |format|
      if @male.save
        format.html { redirect_to @male, notice: 'Male was successfully created.' }
        format.json { render :show, status: :created, location: @male }
      else
        format.html { render :new }
        format.json { render json: @male.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /males/1
  # PATCH/PUT /males/1.json
  def update
    @hobbys = params[:male][:hobbys].split(",")
    @hobbys2 = []
    @hobbys.each do |h|
      @hobbys2.append(h)
    end
    respond_to do |format|
      if @male.update(male_params) and @male.update(hobbys: @hobbys2)
        format.html { redirect_to @male, notice: 'Male was successfully updated.' }
        format.json { render :show, status: :ok, location: @male }
      else
        format.html { render :edit }
        format.json { render json: @male.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /males/1
  # DELETE /males/1.json
  def destroy
    @male.destroy
    respond_to do |format|
      format.html { redirect_to males_url, notice: 'Male was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_male
      @male = Male.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def male_params
      params.require(:male).permit(:name, :birthday, :height, :job, :location, :hobbys, :is_fulfilled)
    end
end
