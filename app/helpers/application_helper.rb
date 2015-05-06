module ApplicationHelper
	def shipping_free(sum)
	  if sum > 12
	    @shipping_free = (sum-12)*5 + 60
	  else
	    @shipping_free = 60
	  end
	end
end