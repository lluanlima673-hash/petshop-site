class VeterinariansController < ApplicationController
  before_action :set_veterinarian, only: %i[ show edit update destroy ]

  # GET /veterinarians or /veterinarians.json
  def index
    @veterinarians = Veterinarian.all
  end

  # GET /veterinarians/1 or /veterinarians/1.json
  def show
  end

  # GET /veterinarians/new
  def new
    @veterinarian = Veterinarian.new
  end

  # GET /veterinarians/1/edit
  def edit
  end

  # POST /veterinarians or /veterinarians.json
  def create
    @veterinarian = Veterinarian.new(veterinarian_params)

    respond_to do |format|
      if @veterinarian.save
        format.html { redirect_to @veterinarian, notice: "Veterinarian was successfully created." }
        format.json { render :show, status: :created, location: @veterinarian }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @veterinarian.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /veterinarians/1 or /veterinarians/1.json
  def update
    respond_to do |format|
      if @veterinarian.update(veterinarian_params)
        format.html { redirect_to @veterinarian, notice: "Veterinarian was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @veterinarian }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @veterinarian.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /veterinarians/1 or /veterinarians/1.json
  def destroy
    @veterinarian.destroy!

    respond_to do |format|
      format.html { redirect_to veterinarians_path, notice: "Veterinarian was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_veterinarian
      @veterinarian = Veterinarian.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def veterinarian_params
      params.expect(veterinarian: [ :name, :crm, :phone ])
    end
end
