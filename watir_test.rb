require 'rspec'
require 'watir'
require 'pry'
 
browser = Watir::Browser.new
 
RSpec.configure do |config|
  config.before(:each) { @browser = browser }
  config.after(:suite) { browser.close unless browser.nil? }
end

describe "a simple demonstration of watir and trad RSpec" do
  before(:each) do
    @browser.goto("https://venmo.com/account/sign-in")
  end
  describe "that we have hit a valid URL" do
    it "should not return an invalid error message" do
      @browser.text.should_not include('The requested URL could not be retrieved')
    end
   end
  describe "the contents of the cukes page" do 
    it "should include venmo" do # the it() represents the detail that will be expressed in the code within the block
      @browser.text.should include('venmo')
    end
    it "should not include the great Nietchzche's name" do
      @browser.text.should_not include('Frederick Nietchzche')
    end
  end
end


# describe "sign up " do
#   before(:each) do
#     @browser.goto("http://pai-test.herokuapp.com/users/sign_up")
#   end
#   describe "that we have a successful signup" do
#     it "should not return an error" do
#       @browser.text.should_not include('The requested URL could not be retrieved')
#       @browser.text_field(:id, "user_first_name").set("Donald")
#       @browser.text_field(:id, "user_last_name").set("Trump")
#       @browser.text_field(:id, "user_email").set("dtrump1000@gmail.com")
#       @browser.text_field(:id, "areacode").set(123)
#       @browser.text_field(:id, "exchange").set(123)
#       @browser.text_field(:id, "last4").set(1234)
#       @browser.text_field(:id, "user_password").set("fakenews2016")
#       @browser.text_field(:id, "user_password_confirmation").set("fakenews2016")
#       @browser.button(:id, "frack").click
#       Watir::Wait.until(browser.text.include? "Welcome! You have signed up successfully")
#     end
#    end
# end

describe "sign in " do
  before(:each) do
    sign_in = @browser.goto("http://pai-test.herokuapp.com/users/sign_in")
    # if value = @browser.div span: 'hidden-xs'
    #   puts "trying to sign out"
    # end
  end
  describe "that we have a successful signup" do
    it "should not return an error" do
      @browser.text.should_not include('The requested URL could not be retrieved')
      @browser.text_field(:id, "user_email").set("dtrump1000@gmail.com")
      @browser.text_field(:id, "user_password").set("fakenews2016")
      @browser.button(:name, "commit").click
      Watir::Wait.until(browser.text.include? "Welcome! You have signed up successfully")
    end
   end
 end

