Given(/^the app has launched$/) do
  wait_for do
    !query("*").empty?
  end
end

When(/^I tap the button$/) do
    touch("* marked:'Tap Me!'")
  # Example: When I create a new entry
  #  tap("* marked:'new_entry'")
  #  wait_for_keyboard
  #  keyboard_enter_text("* marked:'entry_title'", 'My Entry')
  #
  #  tap("* marked:'submit'")
end

Then(/^text should change to hello from vancouver$/) do
    wait_for_element_exists("* text:'Hello from Vancouver!'")
  # Example: Then I should see the entry on my home page
  #  wait_for_element_exists("* text:'My Entry'")
end
