class Product < ApplicationRecord
  belongs_to :category
  has_many :reviews
  acts_as_likeable

  PER = 15

  scope :on_category, -> (category) { where(category_id: category) }
  scope :sort_order, -> (order) { order(order) }
  scope :display_list, -> (page) { page(page).per(PER) }
  scope :category_products, -> (category, page) { 
    on_category(category).
    display_list(page)
  }
  scope :sort_products, -> (sort_order, page) {
    if sort_order[:sort_category].present?
      on_category(sort_order[:sort_category]).
      sort_order(sort_order[:sort]).
      display_list(page)
    else
      sort_order(sort_order[:sort]).
      display_list(page)
    end
  }

  scope :sort_list, -> {
    {
      "並び替え" => "", 
      "価格の安い順" => "price asc",
      "価格の高い順" => "price desc", 
      "出品の古い順" => "updated_at asc", 
      "出品の新しい順" => "updated_at desc",
      "五十音順" => "name asc",
    }
  }

  def reviews_new
    reviews.new
  end
end
