RottenTomatoes
==============


This is an iOS demo application for displaying the latest box office movies using the RottenTomatoes API.

Time spent: 12 hours spent in total

Completed user stories:
Required-
User can view a list of movies from Rotten Tomatoes.  Poster images must be loading asynchronously.
User can view movie details by tapping on a cell
User sees loading state while waiting for movies API.  You can use one of the 3rd party libraries here.
User sees error message when there's a networking error.  You may not use UIAlertView to display the error.  See this screenshot for what the error message should look like: network error screenshot.
User can pull to refresh the movie list.


Optional done-
All images fade in
All images should be cached in memory and disk. In other words, images load immediately upon cold start (optional).


Pods used-
AFNetworking
MBProgressHUD