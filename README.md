Demo For 29 Sept Project
========================

This project is meant to run on the Data Science VMs for the BACPAC
project. A Docker file, however, is included, for convenience.

    > source aliases.sh
    > bu # build the image
    > rss # start rstudio server (port 8787)
    > r # commandline R environment 
    
Outline
=======

### Data Portal Goals

1. Security - the data portal is meant to make it easy to be secure by
   default. Sensitive data is limited by design to projects occupied
   by collaborators.
2. Ease of access - Once logged into your personal virtual machine
   (Linux or Windows) all the data to which you have access is
   available on the file system in a portable fashion. We plan to
   augment this access with libraries in our supported analysis
   languages.
3. Sharing data within collaborations is a critical goal - each
   collaboration has a secure shared space for intermediate results
   and shared code.
4. VM's will have access to HPC via Azure Batch

### Data Submission and Management in Brief

0. How to get an account (briefly)
1. Users have access to (at least) 3 types of data: 
   1. canonical project data
   2. shared project data
   3. personal data
2. Canonical data is read only data for each project mediated by the
   BACPAC. Data will be checked to ensure compliane with BACPAC data
   transfer SOP.
3. Shared project data is for collaborators to share intermediate
   results.
4. Personal data is personal file storage - not visible to other
   collaborators. Non-sensitive data is permitted to moved in and out
   of personal storage.

3. Demo of VMs (Windows and/or Linux)
  a. Log in
  b. Tour of data locations
  c. Show somehow all the software
  d. Start RStudio 
  e. Access data via the BACPAC Backpack or Filesystem
  f. Analysis and Project Storage
  
Notes
=====

1. Demo Read but not Write access to Canonical Data
2. Detail on Additional Software
3. Put together HTML document for the included software
4. Mention - VMs will be Linux and Windows based.
5. HPC via Azure Batch
6. Process of signing up for an account
   Users will need to be affiliated with a project
   

