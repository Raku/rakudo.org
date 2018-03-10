#!/usr/bin/env perl

use lib qw<lib>;
use Mojolicious::Lite;
use Mojo::UserAgent;
use Mojo::File qw/path/;
use Mojo::Util qw/trim/;
use Time::Moment;
use RakudoOrg::Posts;

my $posts = RakudoOrg::Posts->new;
my $ua = Mojo::UserAgent->new;

app->config({ hypnotoad => { listen => ['http://*:4242'], proxy => 1 } });

# plugin 'AssetPack' => { pipes => [qw/Sass  JavaScript  Combine/] };
# app->asset->process('app.css' => 'sass/main.scss');
# app->asset->process('app.js' => qw{
#         js/ie10-viewport-bug-workaround.js
#         js/codemirror/codemirror.min.js
#         js/codemirror/perl6-mode.js
#         js/main.js
#     });

### Routes
get '/' => sub {
    my $c = shift;
    $c->stash(posts => $posts->all);
} => 'home';

get '/post/#post' => sub {
    my $c = shift;
    my ($meta, $markdown, $html) = $posts->load($c->param('post'));
    $html or return $c->reply->not_found;

    $c->stash(%$meta, post => $html, title => $meta->{title});
} => 'post';

any $_ => sub {
    my $c = shift;
    my $posts = [ map +{ %$_ }, @{ $posts->all } ];
    $_->{date} = blog_date_to_feed_date($_->{date}) for @$posts;

    my $blog_last_updated_date = $posts->[0]{date};
    $c->stash(
        posts       => $posts,
        last_update => $blog_last_updated_date,
        template    => 'feed',
        format      => 'xml',
    );
}, ($_ eq '/feed' ? 'feed' : ())
    for '/feed', '/feed/', '/feed/index', '/atom', '/atom/', '/atom/index';

get '/pull/*password' => sub {
    my $c = shift;

    return $c->reply->not_found
        unless $c->param('password') eq trim path('pull-password')->slurp;

    $c->render(
        text   => "Pulled!\n" . `git pull`,
        format => 'txt',
    );
};

app->start;

sub blog_date_to_feed_date {
    my $date = shift;
    return Time::Moment->from_string("${date}T00:00:00Z")
        ->strftime("%a, %d %b %Y %H:%M:%S %z");
}
