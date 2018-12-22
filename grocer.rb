def consolidate_cart(cart)
  cart[:item] = {count: 1}
   cart[:item].each do |k, v|
     if k == k
       k.merge(k)
     end
     end
   end



end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
