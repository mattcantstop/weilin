class RenameAuthenticationTokenToToken < ActiveRecord::Migration
  def change
    rename_column  :users, :authentication_token, :token
  end
end
