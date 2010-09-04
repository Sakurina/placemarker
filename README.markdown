# PlaceMarker
PlaceMarker is like [WebMarker][1], except for virtual representations of real places (Foursquare venues). It injects itself into the [Foursquare iPhone app][2] using [MobileSubstrate][3], a code injection framework for jailbroken iOS devices.

## Current Progress
A little further along than Friday.

Everything in the PlaceMarker tab (except the About button) requires you to be checked into a venue. A pop up will show up to tell you to check in if you are not, but from that point on, whether you are checked in or not will not be verified, so venturing any further may result in crashes.

For development purposes, you can fake a checkin with one line of cycript (see line 55 of PMViewController.m for details). This will make PlaceMarker think you are checked in without actually checking in through Foursquare. (In fact, I haven't tested with an actual checkin yet; I should be able to do that tomorrow afternoon.)

You can tag stuff. The tag button takes you to a GML drawing screen where you can draw your tag. Touching the bottom 160px of the screen will save the tag for that venue. Currently, storage is done locally, but the *PMStubService* could get swapped out for one using 000000book or whatever backend later.

PMStubService currently stores a plist containing each venue's tags inside of Foursquare's document folder. (This path varies on each device, but should be /var/mobile/Applications/*/foursquare.app/../Documents.)

Tag reading/display is currently not possible.

## Research Notes
* **How to find which venue the user is currently at:** The *FriendsViewController* has a *currentPlace* property. Oddly enough, if the user is not currently checked in anywhere, it returns a *Place* object with empty fields instead of nil. **DOESN'T WORK**

## License
Copyright (c) 2010, Yanik Magnan <kirbykirbykirby@gmail.com>

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.


[1]: http://github.com/tbx/webmarker
[2]: http://appshopper.com/social-networking/foursquare
[3]: http://svn.saurik.com/repos/menes/trunk/mobilesubstrate/
