class InputsController < ApplicationController
  before_action :set_input, only: [:show, :edit, :update, :destroy]

  def index
    @inputs = Input.all
  end

  def show
  end

  def new
    @input = Input.new
  end

  def edit
  end

  def create
    binding.pry

    mail = Mail.read(params[:file])
    # @input = Input.new(input_params)
    #
    # respond_to do |format|
    #   if @input.save
    #     format.html { redirect_to @input, notice: 'Input was successfully created.' }
    #     format.json { render :show, status: :created, location: @input }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @input.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def update
    respond_to do |format|
      if @input.update(input_params)
        format.html { redirect_to @input, notice: 'Input was successfully updated.' }
        format.json { render :show, status: :ok, location: @input }
      else
        format.html { render :edit }
        format.json { render json: @input.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @input.destroy
    respond_to do |format|
      format.html { redirect_to inputs_url, notice: 'Input was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_input
      @input = Input.find(params[:id])
    end


    def input_params
      params.require(:input).permit(:name, :phone, :message, :vehicle, :price, :link, :vehicle_brand, :vehicle_model, :km, :accessories)
    end
end
