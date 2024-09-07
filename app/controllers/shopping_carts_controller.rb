class ShoppingCartsController < ApplicationController
  before_action :set_cart, only: %i[index create destroy update_quantity remove_item]
  before_action :set_production, only: %i[create update_quantity remove_item]

  def index
    @user_cart_items = ShoppingCartItem.user_cart_items(@user_cart)
  end

  def show
    @cart = ShoppingCart.find(user_id: current_user)
  end

  def create
    @user_cart.add(@product, product_params[:price].to_i, product_params[:quantity].to_i)
    redirect_to cart_users_path
  end

  def update_quantity
    diff_quantity = calc_diff_quantity

    if 0 < diff_quantity
      @user_cart.add(@product, diff_quantity)
    else
      @user_cart.remove(@product, diff_quantity.abs)
    end

    redirect_to cart_users_path
  end

  def remove_item
    @user_cart.remove(@product, 10000)
    redirect_to cart_users_path
  end

  def update
  end

  def destroy
    @user_cart.buy_flag = true
    @user_cart.save
    redirect_to cart_users_url
  end

  private
    def product_params
      params.permit(:product_id, :price, :quantity)
    end

    def set_production
      @product = Product.find(product_params[:product_id])
    end

    def set_cart
      @user_cart = ShoppingCart.set_user_cart(current_user)
    end

    def calc_diff_quantity
      @user_cart_items = ShoppingCartItem.user_cart_items(@user_cart)
      target_user_cart_item = @user_cart_items.detect { |user_cart_item| user_cart_item.item_id ==  @product.id }
      product_params[:quantity].to_i - target_user_cart_item.quantity
    end
end
