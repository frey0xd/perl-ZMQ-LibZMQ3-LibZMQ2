use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'ZMQ::LibZMQ3::LibZMQ2',
    AUTHOR           => q{Binary.com <perl@binary.com>},
    VERSION_FROM     => 'lib/ZMQ/LibZMQ3/LibZMQ2.pm',
    ABSTRACT_FROM    => 'lib/ZMQ/LibZMQ3/LibZMQ2.pm',
    LICENSE          => 'BSD',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
        'Storable'   => 0,
    },
    PREREQ_PM => {
        'ZMQ::LibZMQ3' => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'ZMQ-LibZMQ2-LibZMQ3-*' },
);
