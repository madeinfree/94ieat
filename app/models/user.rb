class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :orders
  has_many :shipping_infos
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
