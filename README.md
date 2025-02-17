# synology-file-list-backup
How I backup a list of the files on my Synology NAS to iCloud without any external software.

## Approach

For file lists: Synology-compatible `ash` script (`create-file-list.sh`) involked by Synology DSM's built-in Task Scheduler.

For backup to iCloud: Apple Automator Folder Action

### Assumption

That the machine runnning Apple Automator has access to the Synology shared folder with the file list output file.

## Setup / How to use it

### Synology side
1. Login to your Synology's DiskStation Manager (DSM) interface
1. Open Control Panel > Task Scheduler and then click Create > Scheduled Task > User-defined script
1. Name the task, for example "Generate File List"
1. Under the Schedule tab, chose how often to update your file list (I do weekly on Sundays)
1. Under the Task Settings tab, in the User-defined script box, enter the contents of `create-file-list.sh`. Protip: copy the script to your NAS and then open it in Synology's Text Editor (available in Package Center)
1. Make necessary edits to `OUTPUT_FILE` var and click Ok to create the task

### OSX side
1. Open Apple Automator (it comes with your Mac). To do that, press `Command + Space`, type "Automator", and hit `Enter`.
1. Create a New Folder Action by selecting New Document > Choose Folder Action, then click Choose.
1. Set the Source Folder: at the top, next to "Folder Action receives files and folders added to", choose the folder that contains your NAS file list zips that you want to monitor.
1. Add the "Move Finder Items" Action: in the left panel, select Library > Files & Folders. Drag Move Finder Items into the workflow area. In the "To" dropdown, choose the destination folder such as your iCloud Drive.
1. (Optional) Add a Notification Action: to get notified when files are copied, add Display Notification from Utilities.
1. Save the Workflow: press `Command + S`, name it (such as "Move NAS File List to iCloud"), and click Save.
