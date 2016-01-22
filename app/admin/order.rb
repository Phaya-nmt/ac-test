ActiveAdmin.register Order do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#↓表示に当たって必要な項目はすべて入れておく
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
# ここを書くとpermit_paramsよりこちらを優先される
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

    # productと紐付けして表示もできる
    column :product

    # quantity欄
    column :quantity

    column 'price' do |order|
      order.product.price
    end
    # quantityとpriceを掛けてTotalを出力する
    column 'Total' do |order|
      order.product.price * order.quantity
    end
  end

show do
  attributes_table do
    row :id
    row :user_name
    row :address
    row :product_id
    row :product
    row 'Price' do |order|
      order.product.price * order.quantity
    end
    row :created_at
    row :updated_at
  end
end

# グリッドボタンの実装---------------
  # index as: :grid do |product|
  #   link_to image_tag(product.image_path), admin_product_path(product)
  # end
# -----------------------------------


  show do
    render 'some_partial'
    h3 post.title
    div do
      simple_format post.body
      attributes_table do
      row :title
        row :image do
          image_tag ad.image.url
        end
      end
    end
  end

# テーブルカスタム表示の詳細は以下のページ
# https://github.com/activeadmin/activeadmin/blob/master/docs/3-index-pages/index-as-table.md


end


#### 下部にあるpowerted表記の削除-------
# ActiveAdmin.setup do |config|
#   config.view_factory.footer = M_Footer
# end

# class M_Footer < ActiveAdmin::Component
#   def build
#     super(id: "footer")
#     para "Copyright #{Date.today.year} あああああああああああ！！！"
#   end
# end
#### -----------------------------------



# ここまでの手数
#  1174  rails _4.2.5_ new admin-app --skip-bundle
#  1175  cd admin-app/
#  1176  bundle
#  1177  rails g active_admin:install --skip-users
#  1178  rake db:migrate
#  1179  rails s -b 0.0.0.0
#  1180  rails g model product name description:text price:integer image
#  1181  rake db:migrate
#  1182  rails g active_admin:resource product
#  1183  rails s -b 0.0.0.0
#  1184  rails g scaffold order user_name address product:references quantity:integer
#  1185  rails d scaffold order
#  1186  rails g scaffold order user_name address product:references quantity:integer
#  1187  rake db:migrate
#  1188  rails g active_admin:resource order
#  1189  rails s -b 0.0.0.0
#  1190  git init
#  1191  git add .
#  1192  git commit -m "initial commit"
#  1193  rails s -b 0.0.0.0
#  1194  git add .
#  1195  git commit -m "table custam"
#  1196  git push https://github.com/Phaya-nmt/ac-test.git master

