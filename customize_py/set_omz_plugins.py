#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys, re
from fstr_repl import fstr_repl


f = sys.argv[1]

patt = re.compile(r'plugins=\((\n.*)+\n\)')

repl = '''plugins=(
  git
  colored-man-pages
  vi-mode
  autojump
  history
  history-substring-search
)'''

if __name__ == "__main__":
    fstr_repl(f, patt, repl )

