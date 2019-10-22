vim_image=`docker images | grep vim`
if [ -z "$vim_image" ]; then
    # If there isn't the image, pull it from Dockerhub
    docker pull mtzkeeeee/vim:latest
	cat dvim.sh >> ~/.bashrc
fi

. ~/.bashrc
