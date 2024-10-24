%% title: Announce: Rakudo compiler, Release #177 (2024.10)
%% date: 2024-10-24

On behalf of the Rakudo development team, I’m very happy to announce the
October 2024 release of Rakudo #177. Rakudo is an implementation of
the Raku[^1] language.

The source tarball for this release is available from
<https://rakudo.org/files/rakudo>.
Pre-compiled archives will be available shortly.

New in 2024.10:

+ Improvements:
    + Make Date.DateTime timezone aware in 6.e [233b6871]
    + Make { } / hash() (aka empty hash creation) 8x as fast [f725f5f4]
    + Improve error message on unknown traits [8876d1b6]
    + Make sure the numerator is shown on N / 0 error [6adcecd9]
    + Make Int ** Int up to 15% faster [5680202e]
    + Simplify native coercers (possibly up to 50% faster) [fa370cb8]
    + Make REPL message for missing editor more clear [b27e2d07]
    + Seamlessly wrap the "rlwrap" readline wrapper in the REPL [4c046d45][d964ec93][2750112c]
    + Improve error message on missing terminator on "use Foo" [1301c599]
    + Also show file/line on ambiguous dispatch error [91e46d29]

+ Additions:
    + Add :by to .min/.max/.minmax [6edab9f9]
    + Add Mu.Callable($method) "coercer" in 6.e [b5f11446]
    + Add Mu ACCEPTS candidates for Mu:D [496176bd]
    + Add Associative HyperWhatever support [6bd2ec10]
    + Introduce :smartcase in 6.e on .contains, .starts-with, .ends-with,
      .index, .rindex, .substr-eq [aefe74a9]
    + Add IO::Path.stem in 6.e [b8611ad6]
    + Add EnumHOW.roles method [1e0025c3]
    + Add "quit" as an obsolete alternative to "exit" in error message [391e3b50]
    + Add clocks and mouses to magic inc/dec [03659cd0]
    + Add support for "any" junctions in regex interpolation [e08f6e0b]
    + Add support for Unicode vulgar fractions to val() [98fdf95a][ed231a0c][00031912]

+ Fixes:
    + Fix LTA error on invalid trait on anonymous parameter [09c89d1f]
    + Allow for $:F as placeholder variable with "use isms" [6c6a7da6]
    + Restore +permutations(30) behaviour [5c335df0]
    + Make .head/.tail nodal [29e2b9bf]
    + Make sure fractional shapes are intified properly [b1f0f5d1]
    + Restore :$source parameter to load(...) multi [59631b18]
    + Don't assume @*ARGS only contains strings [50a68ec9]
    + Don't create unnecessary Failures on numeric infix operators [6f8d314c]
    + Rework Rat <=> < <= => > Rat candidates to handle <N/0> more consistently [c05f1704][3c4cfc43]
    + Fix handling of IO::Paths in IO::Notification.watch-path [064575a4]
    + Require a mutable container for .substr-rw [7faddfd2]
    + Allow Cool values in .trans specification [91c93029]
    + Produce correct result for atomicint.Range [1660d96f]
    + Fix LTA error message on num % / ** num [07742935]
    + Make Iterable:U.flat do the right thing [0fc7d45f]
    + Mark "lazy-if" method as implementatio detail [d3f058d9]
    + Repair behaviour of Any|Match.print-nl [d332d19a]
    + Allow empty names in .uniparse [3359987a]
    + Handle .comb with negative limit better [278eb69a]
    + Make ForeignCode.gist less verbose [cf664300]
    + Mark Supplier.unsanitized-supply as an implementation detail [eda67b3a]
    + Make prefix - not negate 0 as real value in i [a9c9e398]
    + Fix Any:D.say|put|note [75557437]
    + Make Inf .. xxx produce Nils [ce5e02cd]
    + Make +((5..2).reverse) produce correct value [258a1b54]
    + Allow CLI arguments in the REPL with --repl-mode=interactive [2825646a]
    + Allow sequences as target in :unique :as [ee7c0b4f]
    + Give IO::Path.slurp the same reading semantics as IO::Handle.slurp [3d2f478b]
    + Remove install-dist.p6 file [368ec5c3]
    + Make sure (Iterable,).flat doesn't hang [a6450e45][ce03069d]
    + Make .elems call on type objects consistent [c9d6f7fc]
    + Make Seq.sort in line with sort(Seq) [5e9d63da]
    + Unbreak module loading [JVM] [9f41d2c6]
    + Flatten without overflow/underflow issues [JVM] [ff50e329]

+ Deprecations:

+ Internal:
    + Separate Array.List(:view) handling into a separate candidate [438067e0]
    + Give all :$view cases their own candidates [edd6c2d3]
    + Properly compose 'with[out]' with external loops [cfdde065]
    + Avoid repeated attribute lookups in METAOP_REDUCE_RIGHT [60b0edb9]
    + Centralize creation of 0 denominator Rats [53a5ba75]

+ RakuAST Development:
    + over 40 commits, 142/153 (make test), and 1158/1355 (make spectest)
      [83fc6788][702559fb][a469819c][d048d9f0][31795cd2][0ebeee03][67a426bb]
      [bd944e89][066afa40][8b61f167][c9d03adf][19a32df0][7d080edd][ebe9136f]
      [804c4041][1cedcee6][82ecf39b][d2f12f35][dd62b98e][9b31d7c6][498b9142]
      [91f2f3c1][ea5a74d2][b56ba4c5][817c9ae1][49005b54][e9ba6ef9][5753baf2]
      [ab408076][0649fcc5][b5c36075][0d199cb0][2f8bd239][73dd90e1][9f4416de]
      [b1670268][4d645898][b50d986a][302241fe][5e95151b][efb42ea7][a1ccc7d3]
      [45a6cdd8][c0ad99ea][314eb114]

The following people contributed to this release:

Elizabeth Mattijsen, Timo Paulssen, Will Coleda, Christian Bartolomäus,
Tom Browder, ZzZombo, Daniel Green, Justin DeVuyst, rir, Ben Davies,
Jan-Olof Hendig, Nick Logan, Salvador Ortiz, Wenzel P. P. Peppmeyer,
ab5tract, librasteve, raiph

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

The next release of Rakudo (#178), is tentatively scheduled for 2024-11-21.

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
