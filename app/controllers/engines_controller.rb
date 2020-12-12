class EnginesController < ApplicationController
  before_action :set_engine, only: [:show, :edit, :update, :destroy]
  
  def index
    @engines = Engine.all
  end

  def show
  end

  def new
    @engine = Engine.new
  end
  
  def create
    @engine = Engine.new(engine_params)
      
    respond_to do |format|
     if @engine.save
        format.html { redirect_to engines_path, notice: 'Engine was successfully created.' }
     else
        format.html { render :new }
     end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
     if @engine.update(engine_params)
        format.html { redirect_to engines_path, notice: 'Engine was successfully updated.' }
     else
        format.html { render :edit, error: "#{@engine.errors.full_messages}" }
     end
    end
  end

  def destroy
    @engine.destroy

    respond_to do |format|
      format.html { redirect_to engines_path, notice: 'Engine was successfully deleted.' }
    end
  end

  private

  def set_engine
    @engine = Engine.find(params[:id])
  end

  def engine_params
    params.require(:engine).permit(:name, :power_indicator, :drone_id)
  end
end
