:: Copy over the banks to the datafiles folder.
if not exist %YYprojectDir%\datafiles\Banks md %YYprojectDir%\datafiles\Banks
copy %YYprojectDir%\FMOD\Build\Desktop %YYprojectDir%\datafiles\Banks