function dvim() {
        # Check if the image exists
		# If it doesn't, build it 
		vim_image=`docker images | grep vim`
		if [ -z "$vim_image" ]; then
			# If there isn't a directory of vim-docker

		fi

		vim_container=`docker ps -a | grep vim`
        # If the container already exists
		if [ -z "$vim_container" ]; then
        	docker run -it \
			           --name vim \
					   -v $HOME:$HOME \
					   -w $PWD \
					   -e COLUMNS=$(tput cols)
					   -e LINES=$(tput lines)
					   vim:8.1 vim $1
		else
			docker start vim
        	docker exec -it vim bash -c "cd $PWD && vim $1"
		fi
}
