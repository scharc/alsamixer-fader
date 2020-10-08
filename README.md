# alsamixer-fader
Simple Bash-script to Fade Audio Volume with amixer 

I needed a way to trigger a volume change from the command line and wanted linear fade for the volume. It uses the alsa-system.
The script will get the current value via 'amixer get CHANNEL'

simple to use
./fade.sh VOLUME SPEED

VOLUME between 0 - 100  
SPEED sleep between the the 1%-Steps   
