docker run --rm \
  --volume="$PWD:/srv/jekyll:Z" \
  -it jekyll/jekyll \
  jekyll build
