	module StoresHelper
	def status(code_num)
		case code_num
		when 0
		  return "未洽談"
		when 1
		  return "代營運"
		when 2
		  return "自營運"
		else
		  return "有問題"
		end
	end
	def get_name(id)
		@a = Product.find_by(id: id)
		return @a.name
	end
	def get_price(id)
		@a = Product.find_by(id: id)
		return @a.price
	end
	def get_store(id)
		@sname = Store.find_by(id: id)
		return @sname.name
	end
end