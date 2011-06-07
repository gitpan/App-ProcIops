use ExtUtils::MakeMaker;

my @proc_fd =
    grep { ! m{/\.\.?$} }
    glob "/proc/$$/fd/*";
unless (`which strace` && @proc_fd ) {
    print <<'STRACE';
App-ProcIops requires a linux-like /proc/<pid>/fd/* file system and
strace.
STRACE
    exit 0;
}

WriteMakefile(
  ABSTRACT_FROM => 'lib/App/ProcIops.pm',
  AUTHOR => 'Josh Jore <jjore@cpan.org>',
  EXE_FILES => ['bin/proc-iops'],
  LICENSE => 'perl',
  NAME => 'App::ProcIops',
  VERSION_FROM => 'lib/App/ProcIops.pm',
);
