printf "${BLUE}%s${NORMAL}\n" "🎭 Updating Supercharged"
cd "$SUPERCHARGED"

if git pull --rebase --stat origin master
then
printf "${BLUE}%s\n" "✅ Yea! You have updated Supercharged!"

else
   printf "${RED}%s${NORMAL}\n" 'There was an error updating. Try again later?'
fi
