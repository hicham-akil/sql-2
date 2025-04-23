-- 🔥 4. Trigger: before_order_item_insert
-- Before inserting into order_items:

-- Check if there is enough stock

-- If not, throw an error: "Not enough stock for this product"

-- If there is stock, reduce stock accordingly and log the sale into sales_log

CREATE Trigger trg1 
BEFORE INSERT on order_items
for EACH row
begin 
  DECLARE p_stock int;
  SELECT stock into p_stock 
  FROM products WHERE products=NEW.product_id;
  if(p_stock <new.quantity) THEN
    SIGNAL SQLSTATE '45000'
    set MESSAGE_TEXT="Not enough stock for this product";
    ELSE 
    INSERT INTO sales_log(product_id,log_message,log_time) VALUES(NEW.product_id,"insert new order",CURTIME());
    end if;
END;