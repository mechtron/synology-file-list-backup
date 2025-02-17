# synology-file-list-backup
How I backup a list of the files on my Synology NAS to iCloud without any external software.

## Overview  

This approach consists of two components:  

1. **Generating the file list on Synology** – A shell script (`create-file-list.sh`) runs via Synology DSM's built-in Task Scheduler.  
2. **Backing up to iCloud** – An Apple Automator Folder Action automatically moves the generated file list to iCloud.  

## Prerequisites  

- A Synology NAS with access to DSM (DiskStation Manager).  
- A Mac with access to the Synology shared folder where the file list is stored.  

## Setup  

### **Synology Configuration**  

1. Log in to your Synology DSM interface.  
2. Open **Control Panel** > **Task Scheduler**, then click **Create** > **Scheduled Task** > **User-defined script**.  
3. Name the task (e.g., *Generate File List*).  
4. Under the **Schedule** tab, set how often to update the file list (e.g., weekly on Sundays).  
5. Under the **Task Settings** tab, in the **User-defined script** box, enter the contents of `create-file-list.sh`.  
   - **Tip:** Copy the script to your NAS and open it in Synology's **Text Editor** (available in Package Center) for easy modification.  
6. Modify the `OUTPUT_FILE` variable in the script as needed.  
7. Click **OK** to create the task.  

### **Mac Configuration (Apple Automator)**  

1. Open **Apple Automator** (`Command + Space`, type "Automator", and press *Enter*).  
2. Create a **New Folder Action** (`File > New` > Select **Folder Action**, then click *Choose*).  
3. At the top, next to *Folder Action receives files and folders added to:*, select the folder containing your NAS file list backups.  
4. Add a **Move Finder Items** action:  
   - In the left panel, go to **Library** > **Files & Folders**.  
   - Drag **Move Finder Items** into the workflow area.  
   - In the *To* dropdown, choose your **iCloud Drive** (or another destination).  
5. *(Optional)* Add a **Display Notification** action (under **Utilities**) to get alerts when files are copied.  
6. Save the workflow (`Command + S`), name it (e.g., *Move NAS File List to iCloud*), and click **Save**.  

## Notes  

- Ensure your Mac has access to the NAS shared folder where the file list is stored.  
- You can modify the script to adjust file formats, filters, or additional automation.  

## License  

This project is open-source under the [MIT License](LICENSE).  
