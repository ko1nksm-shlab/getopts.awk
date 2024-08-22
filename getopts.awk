function getopts(optstring, args,  i, j) {
  i = OPTIND ? int(OPTIND) : (OPTIND = 1)
  j = int(substr(OPTIND, length(i) + 2))
  OPTERR = OPTARG = ""
  if (!(i in args)) return
  if (args[i] == "--") { OPTIND = i + 1; return }
  if (args[i] !~ /^-./) return
  OPT = substr(args[i], j + 2, 1)
  OPTARG = substr(args[i], j + 3)
  if (index(optstring, OPT ":")) {
    if (OPTARG == "") {
      if (!(++i in args)) {
        OPTERR = "option requires an argument -- " OPT
        OPTARG = ":"
        return
      }
      OPTARG = args[i]
    }
    OPTIND = i + 1
  } else if (OPT != ":" && index(optstring, OPT)) {
    OPTIND = (OPTARG == "") ? (i + 1) : (i "," (j + 1))
  } else {
    OPTERR = "illegal option -- " OPT
    OPTARG = "?"
    return
  }
  return 1
}