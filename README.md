= Is It BOCC Tomorrow?

====Disclaimer

This site and code is not officially supported or endorsed by the
Boulder Open Coffee Club.  For official BOCC information please visit
[http://boulderopencoffeeclub.com](http://boulderopencoffeeclub.com) for
more information

====What is BOCC?

Boulder Open Coffee Club is a open group that discusses technology and
startups, hosted at Atlas Purveyors.

====Algorithm

The application is seeded with a historical BOCC event.  We simply get
tomorrows date, get the difference in days between 'tomorrow' and the
seed date, and if that number of days is cleanly divisible by 14 then
'tomorrow' *should* be a BOCC.

However at some point there might be a feature to "override" the status
for a calculated date, which would be open to the community
