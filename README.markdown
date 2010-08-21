# PlaceMarker
PlaceMarker is like [WebMarker][1], except for virtual representations of real places (Foursquare venues). It injects itself into the [Foursquare iPhone app][2] using [MobileSubstrate][3], a code injection framework for jailbroken iOS devices.

## Current Progress
Just in the starting stages. Literally all it does right now is add a *PlaceMarker* tab to the tab bar, and upon tapping it you get a yellow tab with a working About button.

## Research Notes
* **How to find which venue the user is currently at:** The *FriendsViewController* has a *currentPlace* property. Oddly enough, if the user is not currently checked in anywhere, it returns a *Place* object with empty fields instead of nil.

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