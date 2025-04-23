-- 🔧 1. Function: get_total_order_price(orderId)
-- Create a function that returns the total price of a given order (based on quantity × price).
use training;

CREATE Function get_total_order_price(p_orderId INT)RETURNS DECIMAL(10,2)
begin
  DECLARE return_value DECIMAL(10,2);
  SELECT sum(O.quantity* P.price) INTO return_value
  FROM order_items O
  JOIN products P ON `P`.id=O.product_id
  WHERE `O`.order_id=p_orderId;
  RETURN return_value;
END;
DROP FUNCTION get_total_order_price;
SELECT get_total_order_price(1);