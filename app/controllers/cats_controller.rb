class CatsController < ApplicationController
  before_action :set_cat, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  

  # GET /cats
  # GET /cats.json
  def index
    if current_user.admin?
      @cats = Cat.paginate(page: params[:page], per_page: 20).order(cuteness_score: :desc)
    else
      redirect_to action: :fight and return
    end
  end

  # GET /cats/1
  # GET /cats/1.json
  def show
  end

  def top    
      @cats = Cat.top_cats(10,params[:custom_date])      
  end

  def fight
    tmp = Cat.get_random_cats(2)
    @cat_1 = tmp[0]
    @cat_2 = tmp[1]
  end
  # GET /cats/new
  def new
    @cat = Cat.new
  end

  # GET /cats/1/edit
  def edit
  end

  # POST /cats
  # POST /cats.json
  def create
    @cat = Cat.new(cat_params)

    respond_to do |format|
      if @cat.save
        format.html { redirect_to @cat, notice: 'Cat was successfully created.' }
        format.json { render :show, status: :created, location: @cat }
      else
        format.html { render :new }
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cats/1
  # PATCH/PUT /cats/1.json
  def update
    respond_to do |format|
      if @cat.update(cat_params)
        format.json { render :show, status: :ok}
        format.html { redirect_to fight_path, notice: 'Cat was successfully updated.' }
      else
        format.json { render json: @cat.errors, status: :unprocessable_entity }
        format.html { render :edit }
        
      end
    end
  end

  def vote
    #byebug
    @cat = Cat.find(params[:id])
    @cat.votes << Vote.create
    #@cat.increment!(:cuteness_score)
    redirect_to action: :fight
  end

  # DELETE /cats/1
  # DELETE /cats/1.json
  def destroy
    @cat.destroy
    respond_to do |format|
      format.html { redirect_to cats_url, notice: 'Cat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat
      @cat = Cat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cat_params
      params[:cat]
    end
end
