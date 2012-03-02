
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "An interface to the SendGrid email service",
  "AUTHOR" => "Jonathan Lloyd <webmaster\@lifegames.org>",
  "BUILD_REQUIRES" => {
    "Data::Dumper" => 0,
    "Test::More" => "0.96",
    "Try::Tiny" => "0.09"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "WebService-SendGrid",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "WebService::SendGrid",
  "PREREQ_PM" => {
    "Carp" => 0,
    "DateTime::Format::Mail" => 0,
    "HTTP::Request" => 0,
    "HTTP::Response" => 0,
    "JSON::XS" => "2.3",
    "Mail::RFC822::Address" => 0,
    "Moose" => 2,
    "Moose::Util::TypeConstraints" => 2,
    "MooseX::Method::Signatures" => "0.36",
    "URI" => 0
  },
  "VERSION" => "1.01",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



