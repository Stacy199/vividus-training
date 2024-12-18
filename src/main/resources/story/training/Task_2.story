GivenStories: story/demo/Homepage_Demo.story

Scenario: Initialize story
Given I initialize story variable `swagGoodUserName` with value `standard_user`
Given I initialize story variable `swagPassword` with value `secret_sauce`

Scenario: Log In as good user
When I enter `${swagGoodUserName}` in field located by `xpath(//*[@id="user-name"])`
And I enter `${swagPassword}` in field located by `xpath(//*[@id="password"])`
And I click on element located by `xpath(//*[@id="login-button"])`
Then number of elements found by `xpath(//div[@class='inventory_item'])` is equal to `6`
When I take screenshot
