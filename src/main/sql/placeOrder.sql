-- 支付执行存储过程
DEDELIMITER $$

create procedure `order_items`.`execute_placeOrder`
  (in v_oiid varchar(60) , in v_uid varchar(60), in v_pid varchar(60) ,in v_count int, in v_date varchar(60) ,
    in v_status int, in v_notes varchar(1000) , in v_address_id varchar(60), out r_result int)
    begin
      declare insert_count int default 0;
      start transaction ;
      insert into order_items(oiid, uid, pid, count, date, status, notes, address_id)
          values (v_oiid, v_uid, v_pid, v_count, v_date, v_status, v_notes, v_address_id);
      select row_count() into insert_count;
      if (insert_count = 0) then
        rollback;
        set r_result = -1;
      elseif (insert_count < 0) then
        rollback;
        set r_result = -2;
      else
        update product set stock = stock-v_count
         where pid = v_pid
          and stock >= v_count;
        select row_count() into insert_count;
        if (insert_count = 0) then
          rollback;
          set r_result = -1;
        elseif (insert_count < 0) then
          rollback;
          set r_result = -2;
        else
          commit;
          set r_result = 1;
        end if;
      end if;
    end;
  $$

  DELIMITER ;
