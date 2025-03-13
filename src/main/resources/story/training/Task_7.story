Meta:
    @group Training
    @requirementId MyTask-0007

Lifecycle:
Examples:
|userEmail	    		    |password		|
|standard_user				|secret_sauce	|

Scenario: Navigate to the website homepage
Given I am on main application page
When I wait until element located by `caseSensitiveText(Swag Labs)` appears
Then `${current-page-url}` is equal to `https://www.saucedemo.com/`
When I take screenshot

Scenario: Log In
Given I am on main application page
When I enter `<userEmail>` in field located by `xpath(//*[@id="user-name"])`
When I enter `<password>` in field located by `xpath(//*[@id="password"])`
And I click on element located by `xpath(//*[@id="login-button"])`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
Then number of elements found by `xpath(//div[@class='inventory_item'])` is equal to `6`
When I click on element located by `xpath(//*[@id="react-burger-menu-btn"])`
And I click on element located by `xpath(//*[@id="reset_sidebar_link"])`
When I refresh page
When I take screenshot

Scenario: Add item to the shopping cart
Given I am on page with URL `https://www.saucedemo.com/inventory.html`
When I click on an element with the text '<itemName>'
Then the page with the URL containing '<itemPageId>' is loaded
When I click on element located by `<addToCartButtonId>`
And I click on element located by `xpath(//*[@id="back-to-products"])`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
When I take screenshot
Examples:
|itemName       		    |itemPageId				  |addToCartButtonId|
|Sauce Labs Backpack		|id=4 					  |xpath(//*[@id="add-to-cart"])|
|Sauce Labs Bolt T-Shirt	|id=1					  |xpath(//*[@id="add-to-cart"])|
|Sauce Labs Fleece Jacket   |id=5					  |xpath(//*[@id="add-to-cart"])|

Scenario: Populate checkout data
Given I am on page with URL `https://www.saucedemo.com/inventory.html`
When I click on element located by `xpath(//*[@id="shopping_cart_container"])`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/cart.html`
When I click on element located by `xpath(//*[@id="checkout"])`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/checkout-step-one.html`
When I enter `#{generate(Name.firstName)}` in field located by `xpath(//*[@id="first-name"])`
And I enter `#{generate(Name.lastName)}` in field located by `xpath(//*[@id="last-name"])`
And I enter `#{generate(bothify '???-#####')}` in field located by `xpath(//*[@id="postal-code"])`

Scenario: Complete checkout process
When I click on element located by `xpath(//*[@id="continue"])`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/checkout-step-two.html`
When I click on element located by `xpath(//*[@id="finish"])`
When I save text of element located by `xpath(//h2[@class='complete-header'])` to scenario variable `ThankYouText`
Given I initialize scenario variable `expectedThankYouText` with value `#{loadResource(/data/message.txt)}`
Then `#{eval('${ThankYouText}' == '${expectedThankYouText}')}` is equal to `true`
