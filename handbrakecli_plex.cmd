@ECHO OFF

REM	========================================================================
REM	Filename:	handbrakecli_plex.cmd
REM	Author:		Adam Linkous
REM	email:		alinkous@gmail.com
REM	Creation Date:	2013-07-04
REM	Last Update	2013-07-06
REM	Version:	0.2.3
REM	Description:	The purpose of this script is to convert existing mkv
REM			files into mp4 containers with H.264 encoding.
REM			This will leverage the already existing "Plex"
REM			preset in Handbrake which was created as per the noted
REM			URL.
REM	URL:		http://www.iskysoft.com/article/preset-option-in-handbrake-to-play-in-plex.html
REM	OS:		Windows Vista Home Premium SP2 Version 6.0.6002
REM	Platform:	CMD Shell Version 2
REM	========================================================================


REM =================
REM Declare variables
REM =================
:: location of all mkv's
SET root_path=g:\Adam\
:: location of Movie mkv's
SET mov_dir=Movies\
:: location of tv mkv's
SET tv_dir=TV Shows\
:: movie mkv path
SET mov_path=%root_path%%mov_dir%
:: tv mkv path
SET tv_path=%root_path%%tv_dir%

:: utility
SET hbcli=d:\Program Files\Handbrake\HandBrakeCLI.exe
:: plex preset
SET hbprst_plex="Plex"

SET log_file=d:\log_files\handbrakecli_plex.log

SET mytest="g:\adam\movies"

REM =================
REM Start code
REM =================
TITLE CONVERTING FILES
CLS
REM FOR EACH MKV FILE IN CURRENT DIRECTORY, and subdirectories, CONVERT TO .MP4 IF FILE DOESN'T ALREADY EXIST
forfiles /p %mytest% /s /m *.mkv /c "cmd /c IF NOT EXIST @fname.mp4 (TITLE Converting @fname & ECHO @fname... & """%hbcli%""" -i "@file" -o "@fname.mp4" --preset=%hbprst_plex% 2> %log_file%) ELSE (ECHO @fname.mp4 already exists!)"


REM =================
REM Exit script
REM =================
TITLE ALL FINISHED!
ECHO Work Complete!
