# StackObj-C

Monday:

Setup your model layer of your stack overflow client. Create a class for a question and a user. Model them using the stack overflow API.
Structurally, set your app up very similar to our Github client. Use a split view controller to help with universal layout. 
Create a network controller with a method designed to fetch questions based on a tag. Consult the stack overflow API documentation to find the endpoint for this.
Parse the results and show them in a table view. Do this inside of a QuestionSearchViewController.

Tuesday

Focus on getting Monday's homework setup.
Get OAuth working with your stack overflow app. Use my swift-stackoverflow project as a crutch (https://github.com/bradleypj823/Swift-StackOverFlow (Links to an external site.)) The WebViewController has all the OAuth you will need.

Wednesday

Make sure you get your OAuth working so we stop getting rate limited
Write a unit test to test out your JSON parsing on your question class
Enable localization in your app for any non english language, and set at least one user facing label or button to be translated when the user changes the language setting on the device.

Thursday

Keep building out your StackOverflow app. You should feel free to take it beyond the basic SplitViewController. Make additional API requests against different endpoints. You are fluent enough with iOS and Cocoa now the push the boundaries a little.
Consider adding a CocoaPod to your project. This could be a simple UI control or a class category.
Give KVO and KVC a shot. KVC can be helpful for parsing deeper into JSON dictionary.
