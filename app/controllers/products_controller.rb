class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def home
  end
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @vendors = Vendor.all
  end

  # GET /products/1/edit
  def edit
    @vendors = Vendor.all
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.create(product_params)

    respond_to do |format|
      if @product.valid?
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { redirect_to action: :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update_attributes(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.percentages.destroy_all
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
    @vendors = @product.vendors
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:id,:name, :sku, :count, :description, :supplier_id, :price,
                                      percentages_attributes: [:id, :percentage, :product_id, :vendor_id]
                                    )
  end
end
