# PlaceMarker
PlaceMarker is like [WebMarker][1], except for virtual representations of real places (Foursquare venues). It injects itself into the [Foursquare iPhone app][2] using [MobileSubstrate][3], a code injection framework for jailbroken iOS devices.

## Current Progress
* PlaceMarker is currently unable of telling which venue a user is at... you'd think what I have in Research Notes would work but seemingly not! This means a fake check-in is required for anything in the tab to work; see line 55 of *PMViewController.m* for details.
* While PlaceMarker will throw a dialog at you if not checked in, no buttons are disabled yet, so while it won't keep you from bringing up the capture screen, expect crashes if you do.
* Once checked-in, the tag button pops up the capture view controller. You can then draw your tag. It can have multiple strokes of different color.
* Clicking the *upload to 000000book* button will *NOT* upload it to 000000book, but rather save the tag locally. A plist is created for each foursquare venue in the app's documents folder, containing an array of GML tags. (This path varies on each device, but should be /var/mobile/Applications/*/foursquare.app/../Documents.)
* Tag reading/display is currently not possible.

## Reusable Stuff You Might Be Interested In
* *PMGMLDrawingView* and *PMGMLStroke* are fully SDK-legal classes you can drop into any app to automatically be able to capture GML tags. They do not have any extra dependencies.

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
