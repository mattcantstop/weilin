object @user
attributes :id, :first_name, :last_name, :username, :email, :token
child(@participants) { attribute :user_id, :war_id }
