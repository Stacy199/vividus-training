Scenario: Navigate to the website homepage
When navigate to the website homepage
When I ${baselineAction} baseline with name `loginPage`

Scenario: Log in as a Good User
When navigate to the website homepage
When I login as a Good User with email `${swagGoodUserName}` and password `${swagPassword}`
Then number of elements found by `xpath(//div[@class='inventory_item'])` is equal to `6`
When I ${baselineAction} baseline with name `homepage`

Scenario: Log in as a Locked User Name
When navigate to the website homepage
When I login as a Good User with email `${swagLockedUserName}` and password `${swagPassword}`
Then number of elements found by `xpath(//div[@class='inventory_item'])` is equal to `6`
When I ${baselineAction} baseline with name `homepage`

Scenario: Log in as a Broken User Name
When navigate to the website homepage
When I login as a Good User with email `${swagBrokenUserName}` and password `${swagPassword}`
Then number of elements found by `xpath(//div[@class='inventory_item'])` is equal to `6`
When I ${baselineAction} baseline with name `homepage`

Scenario: Log in as a Slow User Name
When navigate to the website homepage
When I login as a Good User with email `${swagSlowUserName}` and password `${swagPassword}`
Then number of elements found by `xpath(//div[@class='inventory_item'])` is equal to `6`
When I ${baselineAction} baseline with name `homepage`
