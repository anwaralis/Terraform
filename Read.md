*Initial Setup, Manifest & Schema Definition & Guidelines*
sc-ado on-boarding process & access for Release Management repositories:

For application RBAC, request has to be completed via application onboarding portal.
Please reach our to application SDM and Application Request admin for raising the request.
Objective:
Provide Initial setup steps and state the purpose, Definition of manifest files to facilitate the application onboarding swiftly.
Manifest Update Guidelines for the Catalyst app teams:
All the applications irrespective the type of application, must fill in the App-definition Manifest.

All the Applications must fill in App-definition manifest and Compute manifest for the app. 
VM hard limit will be set at the schema level is 32 and soft limit as 28.
Infra/VM Manifest for all the BC3/4/5 must have redundancy/ HA at component level, Ex: 1 HA VM for App server or DB server. (BC4, 5 may use the existing HA configurations which is followed currently newly introduced for BC 3)
Infra/VM manifest - Use the description field to describe the purpose of VM (used for Web component or app server or DB etc..)
BC1 and 2 apps can also have HA set based on the business justification.
Infra/VM manifest is mandated even for the applications that are defined to have Physical spec This is to ensure the Compute information of all the apps are centrally maintained in consistent manner.
Apps that must fill in Compute manifest: https://confluence.global.standardchartered.com/pages/viewpage.action?pageId=2756800332
DR requirements for VM/Infra need not be captured, capture only for Prod (System will automatically reserve same for DR)
Disclaimer and Pre-Requisites:
Please note that this guidelines focuses mostly on the manifests and how to accomplish it effectively. This documentation expects that the readers have a working knowledge of Git and have had already set up the necessary tools in their machines:

Visual Studio Code
SC CLI Git
Kindly ensure that these pre-requisites are met before moving on with the rest of this activity.

Guidelines for Initial Setup:

Step1: Login to Release Management Repo
            https://dev.azure.com/sc-ado/ReleaseManagement

(if you don't have access to ado , please follow sc-ado on-boarding process & access for Release Management repositories: )



Step2: Click on User Settings on the top right corner and click 'Person Access Tokens' and create one
         (Note: This will be your password to clone any repo. Copy it at the time of token creation, later you might not be able to fetch)

Step3: Go to your special release repository by following the link below:

https://dev.azure.com/sc-ado/ReleaseManagement/_git/{YOUR APP ITAM ID}-release

MAKE SURE TO INPUT YOUR ITAM ID IN THE URL BEFORE PASTING ON YOUR BROWSER.

Step4:  Follow the below to understand on checkout/cloning the repository

User Guide (SC-CLI git)

For sc-cli prerequisites, refer the below
https://confluence.global.standardchartered.com/pages/viewpage.action?pageId=2862839623#UserGuide(SCCLIgit)-Prerequisites



For more information on catalyst design:

5. Catalyst Automations_Detailed Design_2023-06-08 - Enterprise Architecture - Confluence (standardchartered.com)

https://confluence.global.standardchartered.com/display/STORENG/SDD.ET.CIS.File.Storage.Geo.11%3A+04+-+Analysis+and+Design

Command helpline:

1.  Create new branch chore/manifest-update: 

Important Note: Make sure you base your branch from the most recent version of chore/manifest-sample. To do so you can do the following:

sc-cli git checkout chore/manifest-sample
sc-cli git pull origin chore/manifest-sample
sc-cli git checkout -b chore/manifest-update
2. Make changes

Please refer to the information below on how to make the changes.

3. Git add 

sc-cli git add --all / git add <filename>
4. Git commit 

sc-cli git commit -m "#<work ID>: <Description of commit>"
5. Git push

sc-cli git push
IMPORTANT Notes

DO NOT APPLY CHANGES to the chore/manifest-sample branch as we will be constantly overwriting it whenever there are new changes in the schema. Kindly branch out from it.
Create a branch named "chore/manifest-update" and start making the manifest updates.  (Note: chore/manifest-sample will be a golden source for your application and watch out for any updates to the existing manifests.)
For Catalyst (Updates should be done in 'prod' folder)
For DevFactory (Updates should be done in 'dev/stage/test' folders)
Don't update/modify the schema.json file.
Repository Structure:
Please go through the below to understand the repo structure for catalyst manifests.

Release Engineering: Repo Structure - System Delivery Framework - Confluence (standardchartered.com)
Application Definition Manifest:
Below are the guidelines for updating app_definition_mf.yml
| S.No | Manifest Field    | Description / What Value Goes In? | Data Type | Mandatory | Sample Value       |
|------|-------------------|-----------------------------------|-----------|-----------|--------------------|
| 1    | meta-data\manifest-schema | To Specify/identify the type of Manifest.<br> Allowed Values:<br>•AppDefinition<br>•AppInstanceDefinition<br>•ComputeConfiguration<br>•StorageConfiguration<br>•NetworkConfiguration<br>•FirewallConfiguration<br>•LandingZoneConfiguration<br>•SecurityConfiguration<br>•ObservabilityConfiguration<br>•ContainerConfiguration | String | Yes | AppDefination |
| 2    | meta-data\manifest-version | Version of app definition yaml.<br>Must be in the format/pattern of<br>“^\\d+.[0-9]{1,2}$” | String | Yes | 0.01 |
