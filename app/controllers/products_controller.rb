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
    # parms = product_params
    # parms = product_params.dup
    # vendor_parms = parms.extract![:vendors_attributes]
    @product = Product.new(product_params)
    @product.save
# a =  @vendor_params[:vendors_attributes].to_hash
#     a.each do |x|
#       warn "x = #{x.inspect}"
#       warn "asdfadxf"
#     end
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    # a = product_params.to_hash
    # a["vendors_attributes"]["0"]["percentages_attributes"]["0"]["id"] = '1'
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
    #
    # @vendor_params = parms.extract! :vendors_attributes
    # parms
  end
end


#
#     params.require(:product).permit(:id,:name, :sku, :count, :description, :supplier_id, :price,
#                                     vendors_attributes: [:id, :product_id, :name,
#                                                          percentages_attributes: [:id, :percentage, :product_id, :vendor_id]
#                                     ])