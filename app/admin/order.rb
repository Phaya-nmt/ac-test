ActiveAdmin.register Order do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :user_name, :address, :product_id, :quantity
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

# カスタムページの実装

  index do
    # チェックボックス
    selectable_column

    # id欄
    column :id

    # user_name欄
    column :user_name

    # address欄
    column :address

    # product_id欄
    column :product_id

    # quantity欄
    column :quantity

    # productと紐付けして表示もできる
    column :product
  end

# テーブルカスタム表示の詳細は以下のページ
# https://github.com/activeadmin/activeadmin/blob/master/docs/3-index-pages/index-as-table.md

end
