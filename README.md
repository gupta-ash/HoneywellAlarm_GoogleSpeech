# HoneywellAlarm_GoogleSpeech
# Google Speech API to call into a Honeywell Alarm System, convert the spoken status to text and email status

This project uses Asterisk VoIP server to call into the Honeywell Alarm System on a regular basis. Honeywell Alarm System speaks the status of the system. The project records the status voice, sends it to Google Speech API, translates the results to text and uses the text to update Home Automation software and email the status back to owner.

The project contains the following files:
STATUS.call: This file is copied to /var/spool/asterisk/outgoing to intitiate an outbound call from Asterisk to the Honeywell Alarm System. 
HWAlarmControl.sh: This file can be used the the main control file to initiate a status check every few minutes. Use this file in your cron script, home automation server or anywhere else you want to check the status.
extensions_custom.conf: Add the contents of this file to /etc/asterisk/extensions_custom.conf. This instructs Asterisk to call into the Honeywell Alarm System, Dial the entry code, Dial 9 for System Status and record the system status to a file (/home/common/HWAlarmStatus), and then call gcloudspeech.pl to process the recorded response.
gcloudspeech.pl: This file sends the recorded status to Google Speech API, retrieves the encoded text, examines the text for "ARM, DISARMED, BYPASS etc" status and emails the status to the owner.

Installation and Configuration
==============================
1. Place all the files in a common directory. eg: /home/common/bin
2. Add contents of extensions_custom.conf to /etc/asterisk/extensions_custom.conf - customize the Password with the Password to your Alarm System
3. Configure gcloudspeech.pl with the following:
   a. API key for your Google Speech API account
   b. Replace the From: and To: email address to appropriate email addresses
4. Call HWAlarmControl.sh with argument -STATUS and watch Asterisk dial out to your Alarm System, get the status, send the status to Google Speech API, look up the transcribed text and email the status to you.
