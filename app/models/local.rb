class Local < ActiveRecord::Base
	#取得地址的經緯度
	geocoded_by :address
	after_validation :geocode
end
