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
  coupons.each do |coupon|
  name = coupon[:item]
  if cart[name] && cart[name][:count] >= coupon[:num]
    if cart["#{name} W/COUPON"]
      cart["#{name} W/COUPON"][:count] += 1
    else
      cart["#{name} W/COUPON"] = {:count => 1, :price => coupon[:cost]}
      cart["#{name} W/COUPON"][:clearance] = cart[name][:clearance]
    end
    cart[name][:count] -= coupon[:num]
  end
end
cart
end

def apply_clearance(cart)
  cart.each do |item, attributes|
    if attributes[:clearance]
     new_price = attributes[:price]*0.80
    attributes[:price] = new_price.round(2)
  end
end
cart
end

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  coupon_cart = apply_coupons(consolidated_cart, coupons)
  final_cart = apply_clearance(coupon_cart)
  total = 0
  final_cart.each do |name, attributes|
    total += attributes[:price]*attributes[:count]
  end
  if total > 100
    total = total * 0.9
  end
  total
end
