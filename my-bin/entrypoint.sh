#!/bin/bash


if [[ "$1" == "/bin/bash" ]]; then
    /bin/bash $@
elif [[ "$1" == "/bin/sh" ]]; then
    /bin/sh $@
else
    hugo $@
fi




