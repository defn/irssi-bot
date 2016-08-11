use strict;

use Irssi;

sub botinfo {
  my ($template) = shift;
  my ($msg) = sprintf $template, @_;

  Irssi::printformat(MSGLEVEL_CLIENTCRAP, 'bot', $msg);
}

sub event_notice {
  my ($server, $data, $nick, $addr) = @_;
  my ($target, $text) = split(/ :/, $data, 2);

  botinfo '%s (%s) %s: %s', $nick, $addr, $target, $text;
}

sub event_privmsg {
  my ($server, $data, $nick, $addr) = @_;
  my ($target, $text) = split(/ :/, $data, 2);

  botinfo '%s (%s) %s: %s', $nick, $addr, $target, $text;
}

sub bot {
  my ($data, $server, $witem) = @_;

  botinfo '%s: %s', $witem, $data;
}

sub main {
  Irssi::command_bind('bot', 'bot');

  Irssi::signal_add('event privmsg', 'event_privmsg');
  Irssi::signal_add('event notice', 'event_notice');

  Irssi::theme_register([
    'bot', '{line_start} $0'
  ]);
}

main;
