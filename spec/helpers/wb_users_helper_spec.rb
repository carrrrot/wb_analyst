require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the WbUsersHelper. For example:
#
# describe WbUsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe WbUsersHelper do
  it "parse url with domain" do
  	pair = parse_user_url("http://weibo.com/journeyca")
  	expect(pair["wb_id"]).to eq nil
  	expect(pair["domain"]).to eq "journeyca"
  end

  it "parse url with uid" do
  	pair = parse_user_url("http://weibo.com/1418684827")
  	expect(pair["wb_id"]).to eq "1418684827"
  	expect(pair["domain"]).to eq nil
  end

  it "parse url with https" do
  	pair = parse_user_url("https://weibo.com/1418684827")
  	expect(pair["wb_id"]).to eq "1418684827"
  	expect(pair["domain"]).to eq nil
  end

  it "parse url with www" do
  	pair = parse_user_url("http://www.weibo.com/1418684827/profile?topnav=1&wvr=5")
  	expect(pair["wb_id"]).to eq "1418684827"
  	expect(pair["domain"]).to eq nil
  end

  it "parse url with other params" do
  	pair = parse_user_url("http://weibo.com/1418684827/profile?topnav=1&wvr=5")
  	expect(pair["wb_id"]).to eq "1418684827"
  	expect(pair["domain"]).to eq nil
  end

  it "parse bad url" do
  	pair = parse_user_url("fjiwopmlds")
  	expect(pair["wb_id"]).to eq nil
  	expect(pair["domain"]).to eq nil
  end

  it "parse url from other websites" do
  	pair = parse_user_url("http://www.douban.com")
  	expect(pair["wb_id"]).to eq nil
  	expect(pair["domain"]).to eq nil
  end
end
