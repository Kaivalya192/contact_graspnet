docker rm -f contact-graspnet
xhost +local:docker
docker run --name contact-graspnet --gpus all -it -e DISPLAY=$DISPLAY -v "$(pwd)"/test_data:/contact_graspnet/test_data -v /tmp/.X11-unix:/tmp/.X11-unix  --device /dev/dri --network=host  -v "$(pwd)"/contact_graspnet:/contact_graspnet/contact_graspnet contact-graspnet -c "cd /contact_graspnet && bash"