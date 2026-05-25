# Executables that can realistically be installed and exercised in CI
# (GitHub Actions). Microsoft Office (excel/word/powerpoint) cannot.
testable_execs <- c(
  "node",
  "npm",
  "python",
  "pip",
  "chrome",
  "firefox",
  "libreoffice",
  "air",
  "pandoc"
)

# Skip a test when the executable is not installed on the host, so that the
# suite stays green locally / on CRAN and only exercises detection where the
# binary is actually present (e.g. CI).
skip_if_exec_missing <- function(exec) {
  if (!exec_available(exec)) {
    skip(paste0("executable '", exec, "' is not available on this machine"))
  }
}
