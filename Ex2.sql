
⚙️ 2. Procedure: apply_stock_discount(threshold INT, discount_percent INT)
Reduces the price of all products with stock > threshold by discount_percent.

CREATE Procedure apply_stock_discount(threshold INT, discount_percent INT)
begin
  UPDATE products
  SET price=(price*discount_percent)/100
  WHERE stock>threshold;
end;
