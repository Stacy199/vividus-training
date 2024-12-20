Scenario: Navigate to the website homepage
When navigate to the website homepage

Scenario: Log in as a Good User
When I login as a Good User with email `${swagGoodUserName}` and password `${swagPassword}`
Then number of elements found by `xpath(//div[@class='inventory_item'])` is equal to `6`
When I take screenshot
