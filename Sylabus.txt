
Section 1 examines digital forensics in today’s interconnected environments and discusses challenges associated with mobile devices, tablets, cloud storage, and modern Windows operating systems. Hard drive and digital media sizes are increasingly difficult and time-consuming to handle appropriately in digital cases. Being able to acquire data in an efficient and forensically sound manner is crucial to every investigator today. In this course section, we review the core techniques while introducing new triage-based acquisition and extraction capabilities that will increase the speed and efficiency of the acquisition process.
**Digital Forensics and Advanced Data Triage**
***Exercises***
  Windows SIFT Workstation Orientation
  BONUS - Triage-Based Acquisition and Imaging
  Mounting Acquired Disk Images and Evidence
  Carving Important Files from Free Space
  Recovering Critical User Data
  Parse Metadata Information in NTFS Master File Table and USN Journal
***Topics***
  *Windows Operating System Components*
      Key Differences in Modern Windows Operating Systems
  *Core Forensic Principles*
      Analysis Focus
      Determining Your Scope
      Creating and Investigative Plan
  *Live Response and Triage-Based Acquisition Techniques*
      RAM Acquisition and Following the Order of Volatility
      Triage-Based Forensics and Fast Forensic Acquisition
      Encryption Detection
      Registry and Locked File Extraction
      Leveraging the Volume Shadow Service
      KAPE Triage Collection
  *Windows Image Mounting and Examination*
  *NTFS File System Overview*
  *Document and File Metadata*
  *Volume Shadow Copies*
      File and Stream Carving
      Principles of Data Carving
      Recovering File System Metadata
      File and Stream Carving Tools
      Custom Carving Signatures
  *Memory, Pagefile, and Unallocated Space Analysis*
      Artifact Recovery and Examination
      Chat Application Analysis
      Internet Explorer, Edge, Firefox, Chrome, and InPrivate Browser Recovery
      Email and Webmail, including Yahoo, Outlook.com, and Gmail




**Registry Analysis, Application Execution, and Cloud Storage Forensics**
**Overview**
Our journey continues with the Windows Registry, where the digital forensic investigator will learn how to discover 
critical user and system information pertinent to almost any investigation. You'll learn how to navigate and analyze 
the Registry to obtain user profile and system data. During this course section, we will demonstrate investigative 
methods to prove that a specific user performed keyword searches, executed specific programs, opened and saved files, 
perused folders, and used removable devices.

Data is moving rapidly to the cloud, constituting a significant challenge and risk to the modern enterprise. 
Cloud storage applications are nearly ubiquitous on both consumer and business systems, causing interesting security 
and forensic challenges. In a world where some of the most important data is only present on third-party systems, 
how do we effectively accomplish our investigations? In this section we will dissect OneDrive and OneDrive for 
Business, Google Drive, Dropbox, and iCloud, deriving artifacts present in application logs and left behind on 
the endpoint. We'll demonstrate how to discover detailed user activity, the history of deleted files, 
content in the cloud, and content cached locally. Solutions to the very real challenges of forensic acquisition 
and proper logging are all discussed. Understanding what can be gained through analysis of these popular applications 
will also make investigations of less common cloud storage solutions easier.

Throughout this course section, students will use their skills in a real hands-on case, exploring and analyzing 
a rich set of evidence.

***Exercises***
  *Profiling a Computer System Using Windows Registry*
  *Conducting a Detailed Profile of User Activity*
  *Examining Which Applications a User Executed*
  *Examining Recently Opened Files*
  *Perform Cloud Storage Forensics*
***Topics***
  *Registry Forensics In-Depth*
  *Registry Core*
      Hives, Keys, and Values
      Registry Last Write Time
      MRU Lists
      Deleted Registry Key Recovery
      Identify Dirty Registry Hives and Recover Missing Data
      Rapidly Search and Timeline Multiple Registry Hives
  *Profile Users and Groups*
      Discover Usernames and Relevant Security Identifiers
      Last Login
      Last Failed Login
      Login Count
      Password Policy
      Local versus Domain Account Profiling
  *Core System Information*
      Identify the Current Control Set
      System Name and Version
      Document the System Time Zone
      Audit Installed Applications
      Wireless, Wired, VPN, and Broadband Network Auditing
      Perform Device Geolocation via Network Profiling
      Identify System Updates and Last Shutdown Time
      Registry-Based Malware Persistence Mechanisms
      Identify Webcam and Microphone Usage by Illicit Applications
  *User Forensic Data*
      Evidence of File Downloads
      Office and Microsoft 365 File History Analysis
      Windows 7, Windows 8/8.1, Windows 10/11 Search History
      Typed Paths and Directories
      Recent Documents
      Search for Documents with Malicious Macros Enabled
      Open Save/Run Dialog Evidence
      Application Execution History via UserAssist, Prefetch, System Resource Usage Monitor (SRUM), FeatureUsage, and BAM/DAM
      Universal Windows Platform (UWP) and MSIX registry hives
  *Cloud Storage Forensics*
      Microsoft OneDrive
      OneDrive Files on Demand
      Microsoft OneDrive for Business
      OneDrive Unified Audit Logs
      Google Drive for Desktop
      Google Workspace (G Suite) Logging
      Google Protobuf Data Format
      Dropbox
      Dropbox Decryption
      Dropbox Logging
      iCloud
      Synchronization and Timestamps
      Forensic Acquisition Challenges
      User Activity Enumeration
      Automating SQLite Database Parsing




**Shell Items and Removable Device Profiling**
**Overview**
Removable storage device investigations are an essential part of performing digital forensics. 
In this course section, students will learn how to perform in-depth USB device examinations on 
all modern Windows versions. You will learn how to determine when a storage device was first and 
last plugged in, its vendor/make/model, drive capacity, and even the unique serial number of the device used.

Being able to show the first and last time a file or folder was opened is a critical analysis skill. 
Shell item analysis, including shortcut (LNK), Jump List, and ShellBag artifacts, allows investigators 
to quickly pinpoint the times of file and folder usage per user. The knowledge obtained by examining 
shell items is crucial to perform damage assessments, track user activity in intellectual property 
theft cases, and track where hackers spent time in the network.

***Exercises***
  *Understand MSC, HID, and MTP Device Differences*
  *Track USB and BYOD Device Data*
  *Track Bluetooth and Printers*
  *Explore Removable Device Auditing Features in Windows*
  *Use ShellBag Registry Key Analysis to Audit Accessed Folders*
***Topics***
  *Shell Item Forensics*
      Shortcut Files (LNK) - Evidence of File Opening
      Windows 7-10 Jump Lists - Evidence of File Opening and Program Execution
      ShellBag Analysis - Evidence of Folder Access
  *USB and BYOD Forensic Examinations*
      Vendor/Make/Version
      Unique Serial Number
      Last Drive Letter
      MountPoints2 and Drive Mapping Per User (Including Mapped Shares)
      Volume Name and Serial Number
      Username that Used the USB Device
      Time of First USB Device Connection
      Time of Last USB Device Connection
      Time of Last USB Device Removal
      Drive Capacity
      Auditing BYOD Devices at Scale
      Identify Malicious HID USB Devices




**Email Analysis, Windows Search, SRUM, and Event Logs**
*Overview*
Depending on the type of investigation and authorization, a wealth of evidence can be unearthed through 
the analysis of email files. Recovered email can bring excellent corroborating information to an investigation, 
and its informality often provides very incriminating evidence. Finding and collecting email is often one of 
our biggest challenges as it is common for users to have email existing simultaneously on their workstation, 
on the company email server, on a mobile device, and in multiple cloud or webmail accounts. Section 4 arms 
investigators with the core knowledge and capability to maintain and build upon this crucial skill for 
many years to come.

The Windows Search Index can index up to a million items on the file system, including file content, email, 
and over 600 kinds of metadata per file. It is an under-utilized resource providing profound forensic 
capabilities. Similarly, the System Resource Usage Monitor (SRUM), one of our most exciting digital artifacts, 
can help determine many important user actions, including network usage per application and historical VPN 
and wireless network usage. Imagine the ability to audit network usage by cloud storage and identify 60 days 
of remote access tool usage even after execution of counter-forensic programs.

Finally, Windows event log analysis has solved more cases than possibly any other type of analysis. 
Windows 11 now includes over 300 logs, and understanding the locations and content of the available 
log files is crucial to the success of any investigator. Many researchers overlook these records because 
they do not have adequate knowledge or tools to get the job done efficiently.

***Exercises***
  *Search for Email and File Attachments with Forensic Tools*
  *Analyze Message Headers and Gauge Email Authenticity*
  *Collect Evidence from Microsoft and Google Tools*
  *Use Forensic Software to Recover Deleted Objects*
  *Perform Advanced Filtering and Analyze Historical Records*
***Topics***
  *Email Forensics*
      Evidence of User Communication
      How Email Works
      Email Header Examination
      Email Authenticity
      Determining a Sender's Geographic Location
      Extended MAPI Headers
      Host-Based Email Forensics
      Exchange Recoverable Items
      Exchange and M365 Evidence Acquisition and Mail Export
      Exchange and M365 Compliance Search and eDiscovery
      Unified Audit Logs in Microsoft 365
      Google Workspace (G Suite) Logging
      Google Vault Analysis
      Recovering Data from Google Workspace Users
      Web and Cloud-Based Email
      Webmail Acquisition
      Email Searching and Examination
      Mobile Email Remnants
      Business Email Compromise Investigations
  *Forensicating Additional Windows OS Artifacts*
      Windows Search Index Database Forensics
      Extensible Storage Engine (ESE) Database Recovery and Repair
      Windows Thumbcache Analysis
      Windows Recycle Bin Analysis (XP, Windows 7-10)
      System Resource Usage Monitor (SRUM)
          Connected Networks, Duration, and Bandwidth Usage
          Applications Run and Bytes Sent/Received Per Application
          Application Push Notifications
          Energy Usage
    *Windows Event Log Analysis*
      Event Logs of Importance to a Digital Forensic Investigator
      EVTX and EVT Log Files
          Track Account Usage, including RDP, Brute Force Password Attacks, and Rogue Local Account Usage
          Prove System Time Manipulation
          Track BYOD and External Devices
          Microsoft Office Alert Logging
          Geo-locate a Device via Event Logs



**Web Browser Forensics**
Overview
With the increasing use of the web and the shift toward web-based applications and cloud computing, 
browser forensic analysis is a critical skill. During this section, students will comprehensively explore 
web browser evidence created during the use of Google Chrome, Microsoft Edge, Internet Explorer, and Firefox. 
The hands-on skills taught here, such as SQLite, LevelDB, and ESE database parsing, allow investigators to 
extend these methods to nearly any browser they encounter.

Students will learn how to examine every significant artifact stored by the browser, including web storage, 
cookies, visit and download history, Internet cache files, browser extensions, and form data. We will show 
you how to find these records and identify the common mistakes investigators make when interpreting browser 
artifacts. You will also learn how to analyze some of the more obscure (and powerful) browser artifacts, 
such as session restore, HTML5 web storage, zoom levels, predictive site prefetching, and private browsing 
remnants. Browser synchronization is explained, providing investigative artifacts derived from other devices 
in use by the subject of the investigation. Finally, skills to investigate 
Chromium-based Electron\Webview2 Applications are introduced, opening capabilities to investigate hundreds 
of third-party Windows applications using this framework, including chat clients like Discord, Signal, Skype, 
Microsoft Teams, Slack, WhatsApp, Yammer, Asana, and more. ChatGPT usage is becoming common nature. 
Skills to parse activity within the application are explained and methods to analyze are provided.

Throughout the section, students will use their skills in real hands-on cases, exploring evidence created by 
Chrome, Firefox, Microsoft Edge, and Internet Explorer correlated with other Windows operating system artifacts.

***Exercises***
  *Manually Parse SQLite Databases*
  *Track Suspect’s Activity in Browser History and Cache*
  *Parse Automatic Crash Recovery Files*
  *Identify Anti-Forensics Activity*
  *Recover Microsoft Teams and Slack Chats*
***Topics***
  *Browser Forensics*
      History
      Cache
      Searches
      Downloads
      Understanding Browser Timestamps
  *Chrome*
      Chrome File Locations
      Correlating URLs and Visits Tables for Historical Context
      History and Page Transition Types
      Chrome Preferences File
      Web Data, Shortcuts, and Network Action Predictor Databases
      Chrome Timestamps
      Cache Examinations
      Download History
      Web Storage: IndexedDB, Local Storage, Session Storage, and Origin Private File System
      Chrome Session Recovery
      Chrome Profiles Feature
      Chromium Snapshots folder
      Identifying Cross-Device Chrome Synchronization
  *Edge*
      Chromium Edge vs. Google Chrome
      History, Cache, Web Storage, Cookies, Download History, and Session Recovery
      Microsoft Edge Collections
      Edge Internet Explorer Mode
      Chrome and Edge Extensions
      Edge Artifact Synchronization and Tracking Multiple Profiles
  *Internet Explorer*
      Internet Explorer Essentials and the Browser That Will Not Die
      WebCache.dat Database Examination
      Internet Explorer and Local File Access
  *Electron and WebView2 Applications and Chat Client Forensics*
      Electron Application Structure
      Electron Chromium Cache
      LevelDB Structure and Tools
      Manual Parsing of LevelDB
      Specialized LevelDB parsers and tools
  *Firefox*
      Firefox Artifact Locations
      SQLite Files and Firefox Quantum Updates
      Download History
      Firefox Cache2 Examinations
      Detailed Visit Type Data
      Form History
      Session Recovery
      Firefox Extensions
      Firefox Cross-Device Synchronization
  *Private Browsing and Browser Artifact Recovery*
      Chrome, Edge, and Firefox Private Browsing
      Investigating the Tor Browser
      Identifying Selective Database Deletion
  *SQLite and ESE Database Carving and Examination of Additional Browser Artifacts*
      Deleted database record recovery
      DOM and Web Storage Objects
      Rebuilding Cached Web Pages
      Browser Ancestry
      Capturing Stored Browser Credentials



**Windows Forensic Challenge**
Overview
Nothing will prepare you more as an investigator than a complete hands-on challenge requiring you to use 
all the skills and knowledge presented throughout the course. With the option to work individually or in 
teams, students are provided new case evidence to analyze. Fast forensics techniques will be used to 
rapidly profile computer usage and discover the most critical pieces of evidence to answer investigative 
questions. The skills you learn in the class will prepare you for this ultimate CTF!

This complex case involves an investigation into the Windows operating system. The evidence is from real 
devices and provides the most realistic training opportunity currently available. Solving the case requires 
students to use all the skills gained from each of the previous course sections.

This section has been gamified into a CTF allowing everyone to participate easily, whether in person or online.

***Exercises***
  *Full-length Windows 10 forensic challenge*
  *Bonus: One additional complete take home exercise to continue honing your skills!*
***Topics***
  *Digital Forensics Capstone*
      Analysis
      Process and Triage a New Full Set of Evidence
      Find Critical Evidence Following the Evidence Analysis Methods Discussed Throughout the Week
      Examine Memory, Registry, Chat, Browser, Recovered Files, Synchronized Artifacts, Installed Malware, and More
  *Solving*
      Build an Investigative Timeline
      Piece Artifacts Together to Make Sense of the Crime
      Answer Critical Investigative Questions with Factual Evidence
