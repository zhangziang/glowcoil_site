mkdir -p output

mkdir -p output/css
rsync css/* output/css

>output/index.html
sed 's/@title/home/' templates/header.html >> output/index.html
cat templates/post-list-begin.html >> output/index.html

mkdir -p output/posts
for post in posts/*; do
    dir=${post/[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]-/}
    mkdir -p output/$dir
    rsync $post/* output/$dir --exclude index.html --exclude info.txt
    title=$(sed '1q;d' $post/info.txt)
    date=$(sed '2q;d' $post/info.txt)
    sed -e "s/@title/$title/" \
        -e "s/@date/$date/" \
        -e "s#@url#/$dir#" templates/post-list-item.html \
        >> output/index.html
    cat templates/header.html templates/post-header.html $post/index.html templates/footer.html \
        | sed -e "s/@title/$title/" \
              -e "s/@date/$date/" \
        | node katex.js \
        > output/$dir/index.html
done

cat templates/post-list-end.html templates/footer.html >> output/index.html
