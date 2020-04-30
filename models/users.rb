require 'bcrypt'

def create_user (email, username, password, avatar_url)

    digested_password = BCrypt::Password.create(password)
    
    user = run_sql("insert into users (email, username, digested_password, avatar_url) values ('#{email}', '#{username}', '#{digested_password}', '#{avatar_url}');")

    return user

end

def get_all_users()

    users = run_sql("select * from users;")

    return users
end

def get_user_by_username(username)

    user = run_sql("select * from users where username = '#{username}';")

    if user.count == 0
        return nil
    else 
        return user[0]
    end

end

def get_user_by_id(user_id)

    user = run_sql("select * from users where user_id = #{user_id};")[0]

    return user
end
