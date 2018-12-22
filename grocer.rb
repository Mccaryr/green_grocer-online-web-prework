def consolidate_cart(cart)
  cart.each_with_object({}) do |item, value|
    item.each do |category, attribute|
      if value[category]
        attribute[:count] += 1
      else
        attribute[:count] = 1
        value[category] = attribute
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
