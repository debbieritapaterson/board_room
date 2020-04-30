
def run_sql (sql_request)

    connection = PG.connect(ENV['DATABASE_URL'] || {dbname: 'board_room'})
   
    record = connection.exec(sql_request)
    
    connection.close

    return record

end

def create_gear_item(name, item_description, image_url, purchase_location, last_used_location, owner_id)

    new_gear_item = run_sql("insert into gear_items (name, item_description, image_url, purchase_location, last_used_location, owner_id) values ('#{name}', '#{item_description}', '#{image_url}', '#{purchase_location}', '#{last_used_location}', #{owner_id});")

    return new_gear_item

end


def get_all_gear_items()

    gear_items = run_sql('select * from gear_items;')

    return gear_items

end

def get_all_user_gear_items(user_id)

    gear_items = run_sql("select * from gear_items where owner_id = #{user_id};")

    return gear_items

end

def get_gear_by_id(item_id)

    gear_item = run_sql("select * from gear_items where item_id = #{item_id};")[0]

    return gear_item

end

def update_gear_item(name, item_description, image_url, purchase_location, last_used_location, item_id)

    updated_gear_item = run_sql("update gear_items set name = '#{name}', item_description = '#{item_description}', image_url = '#{image_url}', purchase_location = '#{purchase_location}',last_used_location = '#{last_used_location}' where item_id = #{item_id};")

    return updated_gear_item

end

def delete_gear_item(item_id)

    run_sql("delete from gear_items where item_id = #{item_id};")

end



