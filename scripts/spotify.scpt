use AppleScript version "2.4"
use scripting additions

tell application "Spotify"
  if it is running then
    set separator to " ॥ "
    if player state is playing then
      set separator to " ♫ "
    end if
    set track_name to name of current track
    set artist_name to artist of current track
     track_name & separator & artist_name
  end if
end tell
