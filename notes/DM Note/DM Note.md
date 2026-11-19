Dynamic music (one song transitioning to the next) is handled with a variable called "music_state", 
which this engine is built for only this variable in CompleteCookFMOD.fspro.

An array of rooms and correlating state numbers is inside the creation code of obj_music, just like
where the rooms for which music plays itself is housed.

The example event is of SM64 remixes of Hot Spaghetti and Cold Spaghetti under "event:/music/medieval".

Your initial maximum states is 8, but you can easily modify to be larger.
