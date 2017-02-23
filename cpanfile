requires 'ZMQ::LibZMQ3';
requires 'ZMQ::LibZMQ2';
requires 'perl', '5.006';

on configure => sub {
    requires 'ExtUtils::MakeMaker';
};

on test => sub {
    requires 'AnyEvent';
    requires 'Proc::Guard';
    requires 'Storable';
    requires 'Test::More';
};
