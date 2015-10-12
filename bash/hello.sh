#!/bin/bash
                HELLO=Hello
		SMILE=Smile 
                function hello {
                        local HELLO=World
                        echo $HELLO
                }
                function hello1 {
                        local HELLO=World1
                        echo $HELLO
                }
                echo $HELLO
                hello
		hello1
                echo $SMILE

