%% title: Announce: Rakudo compiler, Release #178 (2024.12)
%% date: 2024-12-14

On behalf of the Rakudo development team, I’m very happy to announce the
December 2024 release of Rakudo #178. Rakudo is an implementation of
the Raku[^1] language.

The source tarball for this release is available from
<https://rakudo.org/files/rakudo>.
Pre-compiled archives will be available shortly.

New in 2024.12:

+ Improvements:
    + Re-imagine .polymod as an iterator [c81d9cfe]
    + Simplify Cool.substr-eq candidates [da291b55]
    + Allow *-x (aka a Callable) for position in .substr-eq [c32cb4f6]
    + Re-imagine .substr-rw handling [6182ed58][ba526e30]
    + when starting a Thread, also set its thread name [34cd4c58]
    + Allow a value of 0 with :vent-at [c972df68]
    + Fail gracefully when REPL is initialized without TTY [6c088c8c]
    + Make .trans only assign to $/ if it's assignable [097d6680]
    + Check positional .trans args earlier [59bfd7f6]
    + Some .trans optimizations (upto 50% faster in some cases)
      [de79080d][f5322142][e0c25da2]
    + Make $*USER / $*GROUP provide some string values on Windows [0911eca2]
    + Issue a warning for .trans(abc => ...) [03e2ee74]
    + Make .trans(Regex => Str) about 3 as fast [8365a5de]

+ Additions:
    + Add VM.remote-debugging method [4a93b413]

+ Fixes:
    + Fix using Iterables as indices in multidim array slice [0ff3efff]
    + Re-imagine IO::CatHandle internals [00a09d92]
    + Fix t/04-nativecall/25-embedded.c [76f62fe7]
    + Make "AAS" .. "ABS" use standard .succ semantics in 6.e [7c412a11]
    + Remove the auto-wrapping rlwrap hack [dc034250]
    + Don't use ANSI color in error messages always [a917cf03]
    + Restore old logic in find_best_dispatchee [65a98ce2]
    + [JVM] Remove workarounds for broken deserialization of nqp::null
      [3470f838]
    + [JVM] Unbreak usage of "hash" with named args [d3d08962]
    + Make sure Map.new has an NQP hash always [ba3b24cf]
    + Fix `dir` to give "." and ".." again [b1c40624]
    + Restore error message on Junction sub-sig binding error [5ff3eafe]
    + Have to make sure scalars don't make it into nativecallcast. [8765d617]
    + Fix .Str / .gist / .raku on self-referencing QuantHashes [1340c2b0]
    + Don't use Match::chomp on string [ca7933b8]
    + Type second param of proto for Stash::ASSIGN-KEY [ef46c8e9]
    + Handle classes that don't have a find_method also [e7945cf9]
    + Make (almost) any Failure in a slice throw immediately [a4b87c91]
    + Fix stringification of self referential Hashes [a047a8f7]
    + Decont Routine object when looking for attribute (#5708) [JVM]
      [e4e22694]
    + Fix issues with slices with N..* ranges [65ec7f30]
    + Fix issue with .polymod and fixed number of divisors [c6872fb0]
    + Fix remaining issue with polymod [818a543a]
    + Fix support for .substr-rw(Callable, x) [0ceb4be2]

+ Deprecations:

+ Internal:
    + Some minor tweaks in Main [c697cf04]
    + Remove most of NQP in Range.iterator [f1e2ad94]
    + Internally document the REPL.ctxsave method better [55e40088]
    + Add test for successful use of adverbs on hashes with infixes [d00d8497]
    + Azure run rakuast tests [ad3e9c57][cfa5115c]
    + Assorted test related fixes on Windows [f2c70c7f][686a65d1][65451f83]
      [c772ad8e][82dd2f6d][3820a9ba]
    + Fix tests on Win/cl/debug, make runner resilient to long paths [3b2fb62a]
      [61ee2fdf]
    + Reimagine Azure CI [2208db21][81f2dbe4][e7928e83]
    + don't call nqp::rebless on every statement [38e655f4]
    + Update release guide and Akefile to align with current practice.
      [aa385bb9]

+ RakuAST Development:
    + 3 commits, 142/153 (make test), and 1158/1355 (make spectest)
      [3f0f974e][485474df][d1c99054]

The following people contributed to this release:

Elizabeth Mattijsen, Patrick Böker, Christian Bartolomäus, Daniel Green,
Timo Paulssen, Justin DeVuyst, Nick Logan, Will Coleda, raiph,
Coleman McFarland, ab5tract, Jan-Olof Hendig, Linus G Thiel,
Richard Hainsworth, Daniel Sockwell, librasteve, rir

This release implements 6.c and 6.d versions of the Raku specification.
6.c version of the language is available if you use the `use v6.c`
version pragma, otherwise 6.d is the default.

Upcoming releases in 2024 will include new functionality that is not
part of 6.c or 6.d specifications, available with a lexically scoped
pragma. Our goal is to ensure that anything that is tested as part of
6.c and 6.d specifications will continue to work unchanged. There may
be incremental spec releases this year as well.

If you would like to contribute or get more information, visit
<https://raku.org>, <https://rakudo.org/community>, ask on the
<perl6-compiler@perl.org> mailing list, or ask on IRC #raku on Libera.

Additionally, we invite you to make a donation to The Perl & Raku Foundation
to sponsor Raku development: <https://donate.perlfoundation.org/>
(put “Raku Core Development Fund” in the ‘Purpose’ text field)

The next release of Rakudo (#179), is tentatively scheduled for 2025-01-25.

A list of the other planned release dates is available in the
“docs/release_guide.pod” file.

The development team appreciates feedback! If you’re using Rakudo, do
get back to us. Questions, comments, suggestions for improvements, cool
discoveries, incredible hacks, or any other feedback – get in touch with
us through (the above-mentioned) mailing list or IRC channel. Enjoy!

Please note that recent releases have known issues running on the JVM.
We are working to get the JVM backend working again but do not yet have
an estimated delivery date.

[^1]: See <https://raku.org/>
