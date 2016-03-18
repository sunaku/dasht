## Version 2.0.0 (2016-03-17)

This release improves the local search engine's responsiveness, usability, and
appearance (especially on small displays, like those found in mobile devices);
improves search term highlighting; and fixes escaping bugs and HTML5 validity.

### Major:

  * dasht-query-exec(1) now groups by first letter when nothing is searched.

    This gives you a better overview of the breadth of available topics (A-Z)
    than the previous approach of simply returning the first 100 topics did.

  * dasht-query-html(1) now wraps its HTML output, if any, in `<table>` tags.

    This moves the printing of HTML `<table>` tags into dasht-query-html(1)
    and makes dasht(1) run w3m(1) eagerly, which provides visual feedback to
    the user when a large HTML document is being read and buffered, and in
    the case where no results are found: terminate with a message on stderr.

### Minor:

  * dasht-server-http(1) now streams search results to you as they are found.

    Serve the HTML header and search form immediately---before the search is
    even performed---so that the user instantly (and at the very least) sees
    the search form in case they decide to abort the HTTP transfer partway.

  * dasht-server-http(1) now provides a drop-down menu for docset selection.

    Drop the HTML5 `<datalist>` because it can only suggest a single item, and
    that too only when the text field is empty!  Instead, provide a `<select>`
    drop-down menu from which the user can choose a single item and build up
    multiple docset selections iteratively, with repeated form submissions.

  * dasht-server-http(1) now word-wraps search results to fit small displays.

    Insert word-break opportunity `<wbr>` tags at the end of capitalized
    words, runs of lowercase text, numbers, and punctuation marks to help the
    browser fit search results to small displays, as found in mobile devices.

  * dasht-query-html(1): Underline search terms so they stand out in w3m(1).

### Patch:

  * dasht-query-exec(1): escape SQL single quotes in the search pattern.

  * dasht-query-html(1): escape HTML entities in search result token name.

  * dasht-query-line(1): `tr -s` squeezes _after_ translation, not beforehand.

    Searching for `% %` resulted in SQL LIKE `%\%\%` instead of `%\%%\%%`.

  * dasht-server-http(1): Fix W3C Validator error on scoped `<style>` element.

    > Error: Element style is missing required attribute scoped.

  * dasht-server-http(1): Fix W3C Validator error on docsets `<label>` element.

    > Error: The label element may contain at most one button, input, keygen,
    > meter, output, progress, select, or textarea descendant.

  * dasht-server-http(1): Specify UTF-8 charset for special chars in docsets.

    Bash and Docker docsets use the special "…" ellipsis Unicode character.

  * dasht-query-html(1): Optimize search term highlighting and rework style.

    When an empty pattern was given, useless empty highlights (bold and
    italic) were added between every single character in a search result.

  * dasht-query-html(1): Emulate the IGNORECASE=1 feature for POSIX awk(1).

## Version 1.2.0 (2016-03-14)

### Minor:

  * Added dasht-docsets-extract(1) script for installing third-party docsets
    and for making sure extracted directory names match docset `*.tgz` files.

    Docset tarballs downloaded by dasht-docset-install(1) have no spaces in
    their names, so use the same naming scheme for their extracted folders.
    Thanks to Martijn Hoogendoorn (@mhoogendoorn) for reporting that such
    naming mismatches occur and for suggesting a potential fix in issue #5.

  * dasht-docsets-install(1) and dasht-docsets-remove(1) learned `--force`.

    The `xargs -p` prompt reads from `/dev/tty` so it's not easy to automate.

  * dasht-docsets-remove(1) is now verbose when deleting files because large
    docsets (like the Mono docset, sized at 7.6 GiB) take a while to delete.

  * dasht-query-line(1) now adds default URI fragments to search result URLs,
    letting you skip past the mess of navigation links atop these 138 docsets:

    > AWS_JavaScript, ActionScript, Akka, Android, Angular.dart, AngularJS,
    > Ansible, Apache_HTTP_Server, Appcelerator_Titanium, Arduino, Bash,
    > Boost, Bootstrap_2, C, C++, CMake, CSS, CakePHP, Cappuccino, Chai, Chef,
    > Clojure, Cocos2D, Cocos2D-X, Cocos3D, CodeIgniter, CoffeeScript,
    > ColdFusion, Compass, Cordova, Corona, CouchDB, Craft, D3JS, Dart,
    > Docker, Dojo, Drupal_7, Drupal_8, ElasticSearch, Elixir, EmberJS,
    > Erlang, Express, ExpressionEngine, ExtJS, Font_Awesome, Foundation,
    > GLib, Go, Grails, Groovy, Groovy_JDK, Grunt, Gulp, HTML, Handlebars,
    > Haskell, Ionic, Jasmine, JavaFX, JavaScript, Java_EE6, Java_EE7,
    > Java_SE6, Java_SE7, Java_SE8, Jekyll, Joomla, KnockoutJS, Kobold2D,
    > Laravel, Less, MarionetteJS, Meteor, MongoDB, Mongoose, Mono, Nginx,
    > OpenCV_C, OpenCV_C++, OpenCV_Java, OpenCV_Python, PHP, PHPUnit, Perl,
    > Phalcon, PhoneGap, Play_Java, Play_Scala, Polymer.dart, Processing,
    > PrototypeJS, Puppet, Qt_4, Qt_5, R, React, Redis, Ruby, Ruby_2,
    > Ruby_on_Rails_3, Ruby_on_Rails_4, Ruby_on_Rails_5, Rust, SQLite, SVG,
    > SailsJS, Scala, Semantic_UI, Sencha_Touch, Smarty, Sparrow,
    > Spring_Framework, Statamic, Stylus, Susy, Swift, Symfony, TYPO3, Tcl,
    > Twig, Twisted, Unity_3D, VMware_vSphere, VueJS, WordPress, XSLT, XUL,
    > Xamarin, Xojo, YUI, Yii, Zend_Framework_1, Zend_Framework_2, jQuery,
    > jQuery_Mobile, jQuery_UI.

  * dasht(1) now sets w3m(1) options to make find-on-page more forgiving.

### Patch:

  * dasht-query-exec(1): Guides in C++ docset have 0-length zanchor values.

    This produced URLs with a stray "#" URI fragment separator at the end,
    which in turn broke w3m(1)'s ability to follow links in search results.

  * dasht-query-exec(1): sqlite 3.7.9 wants options _before_ arguments.

    Thanks to @joshpy for reporting this in issue #3 and suggesting the fix.

  * dasht-docsets-install(1): fix gotcha in shell short-circuit evaluation.

    Thanks to Edgar Hipp (@netei) for reporting and fixing this in issue #6.

  * dasht-docsets-install(1) is now visibly faster to install large docsets.

    Don't bother checking whether the docset archive is corrupt or partially
    downloaded because tar(1) will subsequently fail under such cases anyway.

  * dasht-server-http(1): Search form obscured results in mobile browsers.

  * dasht-server-http(1): Bold effect on hover slowed graphical browsers.

## Version 1.1.0 (2016-02-28)

This release adds UNIX manpages, improves the UI, and fixes MacOSX support.

### Minor:

  * Add "[y/N]" hint to xargs confirmation prompt.  Thanks to [Christian
    Höppner]( https://github.com/mkaito ) for suggesting this improvement.

  * Add UNIX manual pages for all scripts, generated using [binman](
    https://sunaku.github.io/binman ).

### Patch:

  * sed(1), awk(1), et. al. differ in curious ways under MacOSX.  Thanks to
    [Alaric Holloway]( https://github.com/skedastik ) and [Kareem Gan](
    https://github.com/magicalbanana ) for reporting bugs and testing fixes.

## Version 1.0.0 (2016-01-24)

Initial public release of dasht, with stable command line API. :birthday:
