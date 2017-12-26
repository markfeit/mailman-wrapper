# Sendmai/Mailman User/Group Wrapper

On Fedora, the Sendmail configuration attempts to run scripts as
`mailnull:mailnull`, causing Mailman to complain about a group
mismtch.  This script and configuration for `sudo` forces calls out
from Sendmail to the Mailman binary to a user and group it finds
palatable.


## Installation

In this directory as `root`, execute `make install`.

In your Sendmail `aliases` file, change all instances that call
the mailman binary from...

```
foo: "|/usr/lib/mailman/bin/mailman post foo"
```
...to...

```
foo: "|/usr/local/bin/mailman-wrapper post foo"
```
