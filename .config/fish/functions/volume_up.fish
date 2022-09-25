function volume_up
dbus-send --print-reply --system --dest=org.bluez /org/bluez/hci0/dev_94_DB_56_5B_24_45 org.bluez.MediaControl1.VolumeUp

end
