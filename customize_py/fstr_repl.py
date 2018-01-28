#!/usr/bin/env python
# -*- coding: utf-8 -*-

def fstr_repl(f, patt, repl):
    """
    fstr_repl is short for file's string replace
    """
    with open(f, 'r+') as fin:
        in_str = fin.read()
        out_str = patt.sub(repl, in_str)

        fin.seek(0, 0)
        fin.write(out_str)

