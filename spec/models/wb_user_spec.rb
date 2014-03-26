require 'spec_helper'

describe WbUser do
  it "set wb_user by api format" do 
  	wb_user = WbUser.new

  	access_token_value = '2.002jeAYBove4BE06f3626588Q25RDD'
  	access_token_expires_at = 1553416673
  	client = WeiboOAuth2::Client.new
  	client.get_token_from_hash({:access_token => access_token_value, :expires_at => access_token_expires_at}) 
  	api_user = client.users.show_by_uid(2285386644)

  	wb_user.set_by_api(api_user)
  	expect(wb_user.province).to eq "400"
  end
end
