major_category_names = ["本", "コンピュータ", "ディスプレイ"]
book_categories = ["ビジネス", "文学・評論", "人文・思想", "スポーツ",
                    "コンピュータ・IT", "資格・検定・就職", "絵本・児童書", "写真集",
                    "ゲーム攻略本", "雑誌", "アート・デザイン", "ノンフィクション"]
computer_categories = ["ノートPC", "デスクトップPC", "タブレット"]
display_categories = ["19~20インチ", "デスクトップPC", "タブレット"]

major_category_names.each do |major_category_name|
    case major_category_name
        when "本" then
            category_names = book_categories
        when "コンピュータ" then
            category_names = computer_categories
        when "ディスプレイ" then
            category_names = display_categories
    end
    category_names.each do |category_name|
        Category.create(
            major_category_name: major_category_name,
            name: category_name,
            description: category_name
        )
    end
end

product_ids = [*1..30]
product_names = [*"1".."30"]
category_ids = [*1..18,*1..12]
array_number = 0

product_ids.each do
  product_name = Faker::Music::RockBand.name
  Product.create(
    name: product_name,
    description: product_name,
    price: product_ids[array_number],
    category_id: category_ids[array_number]
  )
  array_number += 1
end