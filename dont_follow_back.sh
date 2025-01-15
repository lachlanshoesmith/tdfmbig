#!/bin/dash

# modify this, if you like
username_regex='[a-zA-Z0-9._-]+'

# you don't need to modify below, unless instagram breaks
username_json_regex="\"value\": \"($username_regex)\","

if [ -f "followers_1.json" ]; then
	echo "found followers_1.json"
#elif [ -f "followers_1.html" ]; then
#	echo "found followers_1.html"
else
	echo "Couldn't find followers_1.json or followers_1.html.">&2
	exit 1
fi

if [ -f "following.json" ]; then
	echo "found following.json"
#elif [ -f "following.html" ]; then
#	echo "found following.html"
else
	echo "Couldn't find following.json or following.html.">&2
	exit 1
fi

followers_file="$(mktemp)"
following_file="$(mktemp)"

sed -nE "s/$username_json_regex/\1/p" followers_1.json | sed 's/^ *//' | sort > "$followers_file"
sed -nE "s/$username_json_regex/\1/p" following.json | sed 's/^ *//' | sort > "$following_file"

difference="$(diff "$followers_file" "$following_file")"

echo "These people don't follow you back:"
echo "$difference" | sed -nE "s/> ($username_regex)/\1/p"

echo "\nYou don't follow these people back:"
echo "$difference" | sed -nE "s/< ($username_regex)/\1/p"
