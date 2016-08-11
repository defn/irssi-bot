use strict;
use Irssi;

sub info {
  my ($template) = shift;
  my ($msg) = sprintf $template, @_;

  Irssi::printformat(MSGLEVEL_CLIENTCRAP, 'bot', $msg);
}

sub event_notice {
  my ($server, $from_msg, $nick, $addr) = @_;

  info '%s: %s (%s) %s', $server, $nick, $addr, $from_msg;
}

sub event_privmsg {
  my ($server, $from_msg, $nick, $addr) = @_;

  info '%s: %s (%s) %s', $server, $nick, $addr, $from_msg;
}

sub bot {
  my ($cli, $server, $from) = @_;

  info '%s: %s: %s', $server, $from, $cli;
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
