#!/bin/bash
                function quit {
                   exit
                }
                function e {
                    echo $1 $2
                }
                function f {
                    echo $1 $2 $3
                }
                e Hello linux
                f World torvalds некст
                quit
                echo foo

