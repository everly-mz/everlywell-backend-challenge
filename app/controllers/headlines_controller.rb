class HeadlinesController < ApplicationController
  before_action :set_headline, only: %i[ show edit update destroy ]

  # GET /headlines or /headlines.json
  def index
    @headlines = Headline.all
  end

  # GET /headlines/1 or /headlines/1.json
  def show
  end

  # GET /headlines/new
  def new
    @headline = Headline.new
  end

  # GET /headlines/1/edit
  def edit
  end

  # POST /headlines or /headlines.json
  def create
    @headline = Headline.new(headline_params)

    respond_to do |format|
      if @headline.save
        format.html { redirect_to @headline, notice: "Headline was successfully created." }
        format.json { render :show, status: :created, location: @headline }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @headline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /headlines/1 or /headlines/1.json
  def update
    respond_to do |format|
      if @headline.update(headline_params)
        format.html { redirect_to @headline, notice: "Headline was successfully updated." }
        format.json { render :show, status: :ok, location: @headline }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @headline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /headlines/1 or /headlines/1.json
  def destroy
    @headline.destroy
    respond_to do |format|
      format.html { redirect_to headlines_url, notice: "Headline was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_headline
      @headline = Headline.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def headline_params
      params.require(:headline).permit(:heading)
    end
end
