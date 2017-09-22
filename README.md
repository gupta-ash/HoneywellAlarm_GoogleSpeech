# HoneywellAlarm_GoogleSpeech
# Google Speech API to call into a Honeywell Alarm System, convert the spoken status to text and email status

This project uses Asterisk VoIP server to call into the Honeywell Alarm System on a regular basis. Honeywell Alarm System speaks the status of the system. The project records the status voice, sends it to Google Speech API, translates the results to text and uses the text to update Home Automation software and email the status back to owner.

