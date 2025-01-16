Scenario: Navigate to the website homepage
When navigate to the website homepage


Scenario: Log in as a Locked User Name
When navigate to the website homepage
When I login as a Locked User Name with email `${swagLockedUserName}` and password `${swagPassword}`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
Then number of elements found by `xpath(//div[@class='inventory_item'])` is equal to `6`
