class InputsController < ApplicationController
  before_action :set_input, only: [:show, :edit, :update, :destroy]

  def index
    @inputs = Input.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    respond_to do |format|
      if !params[:file].blank? && params[:file].content_type == "message/rfc822"
        mail      = Mail.read(params[:file].tempfile)
        cells     = Inputs::HandleInput.call(mail).response
        # infos     = Inputs::GetInfos.call(cells).response
        Input.create(
          name:     cells[:nome_do_interessado],
          phone:    cells[:telefone_do_interessado],
          message:  cells[:mensagem],
          vehicle:  cells[:veículo],
          link:     cells[:link_do_veículo]
        )
        format.html { redirect_to inputs_path, notice: 'Input was successfully created.' }
      else
        format.html { render :new }
      end
    end
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
