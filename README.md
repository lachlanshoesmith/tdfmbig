# tdfmbig (they don't follow me back, i guess?)

a very simple script that helps you find out:

- who you don't follow back on instagram, and more importantly
- who doesn't follow you back on instagram
  since this uses instagrams own data downloading service and doesn't otherwise scrape instagram, there's no risk of getting your account limited or anything like that.
  it's also considerably safer than other programs, since you don't need to associate your instagram account with this program. you can also very clearly review the data that this script will work with and what it does.

## how-to

1. download your account data from <a href="https://accountscenter.instagram.com/info_and_permissions/dyi/" target="_blank">here</a>.
   1. press 'create export'.
   2. press 'export to device'.
   3. press 'customize information'.
   4. check 'followers and following' under 'connections'. you can uncheck all other options. then press the 'save' button at the bottom.
   5. alter 'date range' to your liking; i suggest 'all time'.
   6. set the 'format' to 'json'.
   7. press 'create files'.
2. download the zip sent to your email, and extract it.
3. move the script to the same folder as these extracted files, and run the script.

## troubleshooting

sometimes zuckerberg and his crew may decide to change the way this information is output. editing the `following_username_json_regex` and `follower_username_json_regex` variables should help you resolve any changes to the formatting. similarly, if you'd like to filter which usernames are checked, you can edit the 'username_regex' variable. by default it should include everyone.
