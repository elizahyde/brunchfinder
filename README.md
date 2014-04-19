<h1>Brunchover</h1>
<p>It can be pretty difficult to make decisions the morning after a late night.  Brunchover does the work for you and only shows you the top 10 places near your search location. We display how many users are checked in on Foursquare so you can avoid the places with the long waiting lists and and enjoy your Brunchover. Need more info a spot? Just click the name to learn more. You can find it live at http://brunchover.com</p>

<h3>How results are chosen</h3>
<p>Although I believe user reviews have their place (picking out specific good items...getting a picture of the atmosphere), I believe that data such as return visits and interaction behavior (photo posting, sharing of a site, etc.) are better indicators of "top spots". I did a lot of experiementation with several APIs, even combining them into crazy alogorithms, but in the end the best metrics and the cleanest code came from using Foursquare's venues API with the <a href="https://developer.foursquare.com/docs/venues/explore" target="_blank">explore endpoint</a>. I choose to do it without user authenticiation (mine or the users) as that would defeat the purpose of my site's simplicity. Each results page shows a max of 10 results.</p>

<h3>Sorting/Ranking</h3>
  <ul>
    <li><span color="#ffc940">10 Result selection:</span> Algorithm based on various popularity over time metrics (total checkins, likes, photos, etc.)</li>
    <li><span color="#ffc940">Initial sort/Most Visited:</span> Total checkins overtime</li>
    <li><span color="#ffc940">Crowd Status:</span> Current checkedin users</li>
  </ul>

<h3>Front-end and design</h3>
<p>I pretty much did the whole html and css by scratch...then bootstrapped the navbar in later code which I may take back. I did leverage CSS from <a href="http://isotope.metafizzy.co/" target="_blank">isotope</a>, the AWESOME jQuery plugin I used for my results page. I did a huge amount of customization and hacking to the CSS but definitely want to shout out to Isotope for the awesome CSS page and the lovely layout plugin. The photos are pulled from the Foursquare venues API again but the <a href="https://developer.foursquare.com/docs/venues/photos" target="_blank">photos endpoint</a>.</p>

<h3>That autocomplete/geocoder</h3>
<p>That's <a href="http://ubilabs.github.io/geocomplete/" target="_blank">Geocomplete</a> by Ubilabs.

<h3>Things it uses:</h3>

  * Rails 3.2.13

  * Ruby 1.9.3

  * PostgreSQL

  * Javascript

  * Jquery

  * AJAX

  * Foursquare API

  * Geocomplete by Ubilabs

  * Bootstrap (just for Navbar, may be removed)

  * Heroku