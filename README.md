# PLog

Searches the given input and prints out everything between lines matching
`START` and `END` (or any other two strings specified by the user).
Similar to line-range operators in Awk and Sed (`,`) or Perl (`..`).

## How to use

```
usage: plog [-h] [-s START] [-e END] [file ...]
```

## Examples

```bash
$ cat log
starting process
...
connecting to server
START
[debug] hello
connected to server
END
...
ending process
$
$ ./plog.pl log
START
[debug] hello
connected to server
END
$
$ cat log | ./plog.pl
START
[debug] hello
connected to server
END
```

```bash
$ cat another_log
checking build environment
...
begin compilation of foo.c
warning unused variable
finished compilation of foo.c
...
begin compilation of bar.c
finished compilation of bar.c
...
begin cleanup
finished
$
$ ./plog.pl -s 'begin compilation' -e 'finished compilation' another_log
begin compilation of foo.c
warning unused variable 'var'
finished compilation of foo.c
begin compilation of bar.c
finished compilation of bar.c
```

```bash
$ # running a Ruby on Rails application and a page is slower than it should be
$ # wrap the controller action in `puts "START"` and `puts "END"; STDOUT.flush`
$
$ bundle exec rails server | ./plog
[2015-04-24 18:09:50] INFO  WEBrick 1.3.1
[2015-04-24 18:09:50] INFO  ruby 2.0.0 (2014-09-19)
[2015-04-24 18:09:50] INFO  WEBrick::HTTPServer#start: pid=53822 port=3000
START
   (0.1ms)  SELECT COUNT(*) FROM "users"
   (0.1ms)  SELECT COUNT(*) FROM "users"
   (0.1ms)  SELECT COUNT(*) FROM "users"
END
```

## How to run test(s)

```bash
$ cd ./test
$ perl test.pl
```
