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