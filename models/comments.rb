def create_comment(gear_item_id, content, owner_id)

    run_sql("insert into comments (gear_item_id, content, owner_id) values (#{gear_item_id}, '#{content}', #{owner_id});")

end

def get_all_gear_item_comments(gear_item_id)
    
    run_sql("select * from comments where gear_item_id = #{gear_item_id};")

end


def get_comment_by_comment_id(comment_id)
    
    run_sql("select * from comments where comment_id = #{comment_id};")[0]

end

def delete_comment(comment_id)

    # deletes content of comment and author/owner of comment
    run_sql("update comments set content = 'I swear I saw a comment here. Maybe it is wearing an invisibility cloak. (Comment deleted)' where comment_id = #{comment_id};")

end

def get_comment_status(comment_id)

    comment_deletion_status = get_comment_by_comment_id(comment_id)["deletion_status"]
  
        if comment_deletion_status == "f"
          return true
        else
          return false
        end

end


# def get_comment_by_user_id(gear_item_id)
    

# end