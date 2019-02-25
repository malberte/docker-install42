#!/bin/bash
#Installing Docker with the Managed Software Center will overload your disk.
#The reason is Docker stores a lot of things in a file called Docker.qcow2
#It grows very fast and that is why you're angry.
#After the installation or if you change of computer, launch this script to make sure
#that this file is moved to the goinfre folder and a link is created.
qcow="Docker.qcow2"
file_qcow="/Users/$USER/Library/Containers/com.docker.docker/Data/vms/0/$qcow"
link_qcow="/goinfre/$qcow"

if [ -f "$link_qcow" ]
then
    echo "FILE $qcowfound at $link_qcow. Deleting it..."
    rm $link_qcow
fi

if [ -L "$file_qcow" ]
then
    echo "LINK $qcow found at $file_qcow. Deleting it..."
    rm $file_qcow
fi

if [ -f "$file_qcow" ] && ! [ -L "$file_qcow" ]
then
	echo "$file_qcow found ! Moving and linking to $link_qcow..."
    mv $file_qcow $link_qcow
    ln -s $link_qcow $file_qcow
    echo "You saved a lot of memory and you're good to go :)"
else
    echo "$qcow does not exist at $file_qcow nor at $link_qcow. Nothing to do, but remember to launch this script after Docker Desktop has started."
fi
