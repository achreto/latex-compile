#!/bin/bash

###############################################################################
# MIT License
#
# Copyright (c) 2019 Reto Achermann
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
###############################################################################

# configuragion. Note BF_SOURCE and BF_BUILD must be absolute paths!
SOURCE_DIR=$(readlink -f `pwd`)
DOCKER_IMG=achreto/latex-compile
#DOCKER_IMG=bf-gitlab-ci-runner
CMD="$@"

echo "docker image: $DOCKER_IMG"
echo "source directory: $SOURCE_DIR"
echo "command: $CMD"

# pull the docker image
docker pull $DOCKER_IMG
if [ $# == 0 ]; then
    exit
fi

# run the command in the docker image
docker run -u $(id -u) -i -t \
    --mount type=bind,source=$SOURCE_DIR,target=/source \
    $DOCKER_IMG /bin/bash -c "(cd /source/ && $CMD)"
