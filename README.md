# getopts.awk

getopts for awk

## Example

```sh
#!/bin/sh

${AWK:-awk} "$(cat getopts.awk)"'
  BEGIN {
    # OPTIND = 1
    while(getopts("fgo:p:", ARGV)) {
      if (OPT == "f") print OPT
      if (OPT == "g") print OPT
      if (OPT == "o") print OPT " : " OPTARG
      if (OPT == "p") print OPT " : " OPTARG
    }
    if (OPTERR) {
      printf "%s (OPT: %s, OPTARG: %s)\n", OPTERR, OPT, OPTARG
      exit 1
    }
    print "Arguments:"
    for (i = OPTIND; i < ARGC; i++) {
      print ARGV[i]
    }
  }' "$@"
```
