## Version 2.2.0 (2017-08-15)

This release fixes the ability to install new docsets (which was broken since
July 2017 due to unannounced, incompatible upstream changes in docset hosting),
improves portability, search form usability, and saves space updating docsets.

### Minor:

  * When a docset is updated, any obsolete files left behind by the previous
    version of the docset's installation are now deleted to save disk space.

  * `dasht-server`: update styling for a more user-friendly search form:
    * Make submit button as tall as the entire form so it's easy to hit.
    * Use monospace font throughout the form to enhance ilIO0o variance.
    * Shorten placeholder text to fit default width of popular browsers.

### Patch:

  * GH-23: Kapeli moved docset download links into Git, breaking our ability
    to install new docsets (because the download links page no longer exists).

    https://github.com/zealdocs/zeal/issues/294#issuecomment-84435400

  * POSIX sed(1) reserves the right to reject the semicolon command separator.

    Per http://pubs.opengroup.org/onlinepubs/009695399/utilities/sed.html

    > Historically, the sed ! and } editing commands did not permit multiple
    > commands on a single line using a semicolon as a command delimiter.
    > Implementations are permitted, but not required, to support this
    > extension.

### Other:

  * `dasht-server`: recommend Chrome browser with [LocalLinks extension](
    https://chrome.google.com/webstore/detail/locallinks/jllpkdkcdjndhggodimiphkghogcpida
    ).

  * README: show how to set up $MANPATH for easy man(1).

  * tar: use UNIX-style invocation syntax: -z after -f.

  * sed: use pipe delimiters when dealing with slashes.

## Version 2.1.0 (2016-05-28)

This release improves the feedback users and scripts get from dasht scripts,
fixes the ability to run dasht from non-setpgid() environments like (Neo)Vim,
adds TAB completion for ZSH, and provides screencasts for prospective users.

### Minor:

  * dasht(1) now automatically opens the first search result if only one.

  * dasht-query-\* scripts now exit with status 44 when no results found.

  * TAB completion for ZSH (see `etc/zsh/` folder) for all dasht scripts.

    Pressing TAB at the first argument completes `''` and puts you on the
    second argument, which is perfect for skipping the pattern altogether.
    Pressing TAB at the second argument completes installed docset names.

    Thanks to Tobias Mersmann (@tmerse) for suggesting this feature and
    providing starter code at <https://github.com/sunaku/dasht/issues/10>.

  * dasht-server-http(1) now shows "no results found" message in browser.

### Patch:

  * dasht-query-line(1) now sets default URI fragment for Erlang docset.

    This affects modules, like the "dets" result in `dasht dets erlang`.

  * dasht-server-http(1) now opens search result links in the same window.

    w3m(1) opens search result links in the _same_ window, so don't make
    the experience any different in browsers connected to dasht-server(1).

  * dasht(1) has revised pipefail emulation since Vim doesn't setpgid().

    When `:!dasht some_query_that_has_no_results_here` is run inside Vim,
    the w3m(1) instance still lives on, even though no results were found,
    because the child processes of dasht(1) don't inherit its pid as pgid.

    That's why terminating all children with kill(1) on pgid doesn't work.
    Instead, the new strategy is to selectively kill w3m(1) first and then
    dasht(1) to achieve the desired effect: no more w3m(1) and nonzero exit.

  * dasht(1) now avoids `/bin/sh: line 1: Terminated` warning under BASH.

    To ensure normal SIGTERM propagation to children, trap SIGUSR1 instead.

  * Revised "no results found" messages for HTML and text user interfaces.

### Other:

  * README: add screencasts of dasht in the terminal and browser:

    Watch the "[dasht in a terminal](https://vimeo.com/159462598)"
    and "[dasht in a browser](https://vimeo.com/159462774)" screencasts.

  * README: add link to vim-dasht plugin for (Neo)Vim integration:

    https://github.com/sunaku/vim-dasht

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
