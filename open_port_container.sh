docker rm -f contact-graspnet
xhost +local:docker
docker run --gpus all  -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix  --network=host -v "$(pwd)"/flask_files:/contact_graspnet/flask_files contact-graspnet