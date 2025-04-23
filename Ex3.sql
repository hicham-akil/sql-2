-- 🔁 3. Cursor: generate_sales_report()
-- A procedure that uses a cursor to:

-- Loop through all order_items

-- Print: product name, quantity, total price (quantity × price)

CREATE Procedure generate_sales_report()
begin
  DECLARE done int DEFAULT 0;
  DECLARE c_name varchar(50);
  DECLARE c_quantity int;
  DECLARE c_price DECIMAL(10,2);
  DECLARE cur CURSOR FOR 
  SELECT P.name , O.quantity , P.price
  FROM order_items O
  JOIN products P ON `P`.id=`O`.product_id;
  DECLARE CONTINUE HANDLER for NOT  found set done=1;      
OPEN cur;
read_loop: LOOP
  FETCH cur INTO c_name,c_quantity,c_price;
  if done THEN 
    LEAVE read_loop;
   end if;
   SELECT sum(c_price*c_quantity) as total ,c_name,c_quantity;
END LOOP;
CLOSE cur;
END;
CALL generate_sales_report();