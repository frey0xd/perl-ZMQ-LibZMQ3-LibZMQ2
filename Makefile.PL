use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'ZMQ::LibZMQ2::LibZMQ3',
    AUTHOR           => q{Binary.com <perl@binary.com>},
    VERSION_FROM     => 'lib/ZMQ/LibZMQ2/LibZMQ3.pm',
    ABSTRACT_FROM    => 'lib/ZMQ/LibZMQ2/LibZMQ3.pm',
    LICENSE          => 'BSD',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
    },
    PREREQ_PM => {
        #'ABC'              => 1.6,
        #'Foo::Bar::Module' => 5.0401,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'ZMQ-LibZMQ2-LibZMQ3-*' },
);
