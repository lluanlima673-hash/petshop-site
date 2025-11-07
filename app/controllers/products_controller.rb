class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /products
  def index
    # Ordena por nome e pagina com 10 por página (Kaminari)
    @products = Product.order(:name).page(params[:page]).per(10)
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: "Produto criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Produto atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_path, notice: "Produto excluído com sucesso."
  end

  # EXPORTA CSV
  def export_csv
    @products = Product.all
    csv_data = CSV.generate(headers: true) do |csv|
      csv << ["ID", "Nome", "Preço", "Estoque"]
      @products.each do |p|
        csv << [p.id, p.name, p.price, p.stock]
      end
    end
    send_data csv_data, filename: "produtos_#{Date.today}.csv"
  end

  # EXPORTA PDF
  def export_pdf
    @products = Product.all
    pdf = ProductsPdf.new(@products).render
    send_data pdf, filename: "produtos_#{Date.today}.pdf", type: 'application/pdf', disposition: 'attachment'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :category_id)
  end
end

