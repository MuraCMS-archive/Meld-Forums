--
-- Table structure for table `mf_conference`
--

CREATE TABLE `mf_conference` (
  `conferenceID` CHAR(35) NOT NULL,
  `siteID` VARCHAR(25) NOT NULL,
  `configurationID` CHAR(35) NULL DEFAULT NULL,
  `name` VARCHAR(150) NOT NULL,
  `title` VARCHAR(150) NOT NULL,
  `description` TEXT NULL,
  `isActive` TINYINT(3) UNSIGNED NOT NULL,
  `friendlyName` VARCHAR(200) NOT NULL,
  `orderNo` INT(10) UNSIGNED NOT NULL,
  `remoteID` VARCHAR(35) NULL DEFAULT NULL,
  `dateCreate` DATETIME NOT NULL,
  `dateLastUpdate` DATETIME NOT NULL,
  `idx` INT(10) UNSIGNED NOT NULL  AUTO_INCREMENT,
  PRIMARY KEY (`conferenceID` ASC),
  KEY `idxFriendlyName` (`friendlyName` ASC),
  KEY `idxRemoteID` (`remoteID` ASC),
  KEY `idxIdx` (`idx` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `mf_configuration`
--

CREATE TABLE `mf_configuration` (
  `configurationID` CHAR(35) NOT NULL,
  `siteID` VARCHAR(25) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `isActive` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
  `restrictReadGroups` VARCHAR(255) NULL DEFAULT NULL,
  `restrictContributeGroups` VARCHAR(255) NULL DEFAULT NULL,
  `restrictModerateGroups` VARCHAR(255) NULL DEFAULT 'RestrictAll',
  `doRequireConfirmation` TINYINT(3) UNSIGNED NULL DEFAULT 0,
  `doAvatars` TINYINT(3) UNSIGNED NULL DEFAULT 0,
  `doClosed` TINYINT(3) UNSIGNED NULL DEFAULT 0,
  `allowAttachmentExtensions` TEXT NULL,
  `doAttachments` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
  `isMaster` TINYINT(3) UNSIGNED NULL DEFAULT 0,
  `filesizeLimit` INT(10) UNSIGNED NOT NULL DEFAULT 0,
  `characterLimit` INT(10) UNSIGNED NOT NULL DEFAULT 0,
  `doInlineImageAttachments` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
  `imageWidthLimit` INT(10) UNSIGNED NOT NULL DEFAULT 0,
  `imageHeightLimit` INT(10) UNSIGNED NOT NULL DEFAULT 0,
  `remoteID` VARCHAR(35) NULL DEFAULT NULL,
  `dateCreate` DATETIME NOT NULL,
  `dateLastUpdate` DATETIME NOT NULL,
  PRIMARY KEY (`configurationID` ASC),
  KEY `remoteID` (`remoteID` ASC),
  KEY `idxRead` (`restrictReadGroups` ASC),
  KEY `idxContrib` (`restrictContributeGroups` ASC),
  KEY `idxMod` (`restrictModerateGroups` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `mf_display`
--

CREATE TABLE `mf_display` (
  `displayID` CHAR(35) NOT NULL,
  `displayTypeID` CHAR(35) NOT NULL,
  `objectID` CHAR(35) NULL DEFAULT NULL,
  `name` VARCHAR(150) NOT NULL,
  `dateCreate` DATETIME NOT NULL,
  `dateLastUpdate` DATETIME NOT NULL,
  `siteID` VARCHAR(25) NOT NULL,
  `params` TEXT NULL,
  `notes` TEXT NULL,
  `isActive` TINYINT(3) UNSIGNED NULL DEFAULT 0,
  `adminID` CHAR(35) NULL DEFAULT NULL,
  `moduleID` CHAR(35) NULL DEFAULT NULL,
  `contentID` CHAR(35) NULL DEFAULT NULL,
  `isValid` TINYINT(3) UNSIGNED NULL DEFAULT 0,
  `settings` TEXT NULL,
  PRIMARY KEY (`displayID` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `mf_displaytype`
--

CREATE TABLE `mf_displaytype` (
  `displaytypeid` CHAR(35) NOT NULL,
  `objectID` CHAR(35) NULL DEFAULT NULL,
  `package` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `settings` TEXT NULL,
  `isConfigurable` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
  `isActive` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1,
  `version` VARCHAR(12) NOT NULL,
  `defaults` TEXT NULL,
  `moduleID` CHAR(35) NULL DEFAULT NULL,
  `dateCreate` DATETIME NOT NULL,
  `dateLastUpdate` DATETIME NOT NULL,
  PRIMARY KEY (`displaytypeid` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `mf_forum`
--

CREATE TABLE `mf_forum` (
  `forumID` CHAR(35) NOT NULL,
  `conferenceID` CHAR(35) NOT NULL,
  `configurationID` CHAR(35) NULL DEFAULT NULL,
  `siteID` VARCHAR(25) NOT NULL,
  `name` VARCHAR(150) NOT NULL,
  `title` VARCHAR(150) NOT NULL,
  `description` LONGTEXT NULL,
  `friendlyName` VARCHAR(200) NULL DEFAULT NULL,
  `isActive` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1,
  `adminID` CHAR(35) NULL DEFAULT NULL,
  `orderNo` INT(10) UNSIGNED NOT NULL DEFAULT 1000,
  `threadCounter` INT(10) UNSIGNED NOT NULL DEFAULT 0,
  `lastPostID` CHAR(35) NULL DEFAULT NULL,
  `remoteID` VARCHAR(35) NULL DEFAULT NULL,
  `dateCreate` DATETIME NOT NULL,
  `dateLastUpdate` DATETIME NOT NULL,
  `idx` INT(10) UNSIGNED NOT NULL  AUTO_INCREMENT,
  `parentID` CHAR(35) NULL DEFAULT NULL,
  PRIMARY KEY (`forumID` ASC),
  KEY `idxConferenceID` (`conferenceID` ASC),
  KEY `idxRemoteID` (`remoteID` ASC),
  KEY `idxSiteID` (`siteID` ASC),
  KEY `idxIdx` (`idx` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `mf_post`
--

CREATE TABLE `mf_post` (
  `postID` CHAR(35) NOT NULL,
  `threadID` CHAR(35) NOT NULL,
  `userID` CHAR(35) NOT NULL,
  `adminID` CHAR(35) NULL DEFAULT NULL,
  `message` LONGTEXT NOT NULL,
  `isActive` TINYINT(3) UNSIGNED NULL DEFAULT 0,
  `isDisabled` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
  `isApproved` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
  `isUserDisabled` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
  `isModerated` TINYINT(3) UNSIGNED NULL DEFAULT 0,
  `dateModerated` DATETIME NULL DEFAULT NULL,
  `doBlockAttachment` TINYINT(3) UNSIGNED NULL DEFAULT 0,
  `attachmentID` CHAR(35) NULL DEFAULT NULL,
  `postPosition` INT(10) UNSIGNED NOT NULL DEFAULT 0,
  `remoteID` VARCHAR(35) NULL DEFAULT NULL,
  `dateCreate` DATETIME NOT NULL,
  `dateLastUpdate` DATETIME NOT NULL,
  `idx` INT(10) UNSIGNED NOT NULL  AUTO_INCREMENT,
  `parentID` CHAR(35) NULL DEFAULT NULL,
  PRIMARY KEY (`postID` ASC),
  KEY `idxUserID` (`userID` ASC),
  KEY `idxThread` (`threadID` ASC),
  KEY `idxRemoteID` (`remoteID` ASC),
  KEY `idxDateCreate` (`dateCreate` ASC),
  KEY `idxPostIdent` (`postPosition` ASC),
  KEY `idxIdx` (`idx` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `mf_searchable`
--

CREATE TABLE `mf_searchable` (
  `threadID` CHAR(35) NOT NULL,
  `postID` CHAR(35) NOT NULL,
  `searchblock` TEXT NOT NULL,
  `dateCreate` DATETIME NOT NULL,
  `dateLastUpdate` DATETIME NOT NULL,
  PRIMARY KEY (`postID` ASC),
  KEY `idx_thread` (`threadID` ASC,`postID` ASC),
  KEY `idx_dateLastUpdate` (`dateLastUpdate` ASC),
  FULLTEXT KEY `idxFullText` (`searchblock` DESC)
) DEFAULT CHARSET=utf8 ENGINE=MyISAM;

--
-- Table structure for table `mf_settings`
--

CREATE TABLE `mf_settings` (
  `settingsID` CHAR(35) NOT NULL,
  `siteID` VARCHAR(25) NOT NULL,
  `isMaster` TINYINT(3) UNSIGNED NULL DEFAULT 0,
  `permissionGroups` VARCHAR(255) NULL DEFAULT 'RestrictAll',
  `themeID` CHAR(35) NULL DEFAULT NULL,
  `threadsPerPage` INT(10) UNSIGNED NOT NULL DEFAULT 20,
  `postsPerPage` INT(10) UNSIGNED NOT NULL DEFAULT 20,
  `subscriptionLimit` INT(10) UNSIGNED NULL DEFAULT 100,
  `allowedExtensions` VARCHAR(255) NULL DEFAULT NULL,
  `deniedExtensions` VARCHAR(255) NULL DEFAULT NULL,
  `filesizeLimit` INT(10) UNSIGNED NULL DEFAULT 100,
  `avatarID` CHAR(35) NULL DEFAULT NULL,
  `avatarResizeType` VARCHAR(45) NOT NULL DEFAULT 'CropResize',
  `avatarQualityType` VARCHAR(45) NOT NULL DEFAULT 'highQuality',
  `avatarAspectType` VARCHAR(45) NOT NULL DEFAULT 'MaxAspectXY',
  `avatarCropType` VARCHAR(45) NOT NULL DEFAULT 'BestXY',
  `userCacheSize` INT(10) UNSIGNED NOT NULL DEFAULT 250,
  `resetAvatar` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
  `doInit` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
  `activeWithinMinutes` INT(10) UNSIGNED NOT NULL DEFAULT 15,
  `searchMode` VARCHAR(45) NOT NULL DEFAULT 'SIMPLE',
  `tempDir` CHAR(35) NOT NULL,
  `baseTempDir` VARCHAR(150) NULL DEFAULT NULL,
  `URLKey` VARCHAR(10) NOT NULL,
  `remoteID` VARCHAR(35) NULL DEFAULT NULL,
  `dateCreate` DATETIME NOT NULL,
  `dateLastUpdate` DATETIME NOT NULL,
  PRIMARY KEY (`siteID` ASC),
  KEY `siteID` (`siteID` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `mf_subscribe`
--

CREATE TABLE `mf_subscribe` (
  `subscribeID` CHAR(35) NOT NULL,
  `conferenceID` CHAR(35) NULL DEFAULT NULL,
  `forumID` CHAR(35) NULL DEFAULT NULL,
  `threadID` CHAR(35) NULL DEFAULT NULL,
  `userID` CHAR(35) NOT NULL,
  `dateCreate` DATETIME NOT NULL,
  `dateLastUpdate` DATETIME NOT NULL,
  `isEmail` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`subscribeID` ASC),
  KEY `idxConf` (`conferenceID` ASC),
  KEY `idxForum` (`forumID` ASC),
  KEY `idxThread` (`threadID` ASC),
  KEY `idxUser` (`userID` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `mf_theme`
--

CREATE TABLE `mf_theme` (
  `themeID` CHAR(35) NOT NULL,
  `name` VARCHAR(35) NOT NULL,
  `packageName` VARCHAR(25) NOT NULL,
  `avatarSmallWidth` INT(10) UNSIGNED NOT NULL DEFAULT 125,
  `avatarSmallHeight` INT(10) UNSIGNED NOT NULL DEFAULT 125,
  `avatarMediumWidth` INT(10) UNSIGNED NOT NULL DEFAULT 250,
  `avatarMediumHeight` INT(10) UNSIGNED NOT NULL DEFAULT 250,
  `avatarDimensionType` VARCHAR(25) NOT NULL DEFAULT 'square',
  `settings` TEXT NULL,
  `defaultAvatar` VARCHAR(80) NULL DEFAULT NULL,
  `isMaster` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
  `style` VARCHAR(12) NULL DEFAULT NULL,
  `remoteID` VARCHAR(35) NULL DEFAULT NULL,
  `dateCreate` DATETIME NOT NULL,
  `dateLastUpdate` DATETIME NOT NULL,
  PRIMARY KEY (`themeID` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `mf_thread`
--

CREATE TABLE `mf_thread` (
  `threadID` CHAR(35) NOT NULL,
  `forumID` CHAR(35) NOT NULL,
  `typeID` INT(10) UNSIGNED NOT NULL DEFAULT 0,
  `siteID` VARCHAR(25) NOT NULL,
  `isActive` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
  `isClosed` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
  `isDisabled` TINYINT(3) UNSIGNED NULL DEFAULT 0,
  `isUserDisabled` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
  `isDraft` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
  `userID` CHAR(35) NOT NULL,
  `adminID` CHAR(35) NULL DEFAULT NULL,
  `adminMessage` LONGTEXT NULL,
  `title` VARCHAR(150) NOT NULL,
  `friendlyName` VARCHAR(200) NULL DEFAULT NULL,
  `orderNo` INT(10) UNSIGNED NOT NULL DEFAULT 0,
  `postCounter` INT(10) UNSIGNED NOT NULL DEFAULT 0,
  `lastPostID` CHAR(35) NULL DEFAULT NULL,
  `dateLastPost` DATETIME NULL DEFAULT NULL,
  `remoteID` VARCHAR(35) NULL DEFAULT NULL,
  `dateCreate` DATETIME NOT NULL,
  `dateLastUpdate` DATETIME NOT NULL,
  `idx` INT(10) UNSIGNED NOT NULL  AUTO_INCREMENT,
  `isAnnouncement` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`threadID` ASC),
  KEY `idxForumID` (`forumID` ASC),
  KEY `idxUserID` (`userID` ASC),
  KEY `idxAdminID` (`adminID` ASC),
  KEY `idxSiteID` (`siteID` ASC),
  KEY `idxRemoteID` (`remoteID` ASC),
  KEY `idxIdx` (`idx` ASC),
  KEY `idxDateLastPost` (`dateLastPost` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `mf_user`
--

CREATE TABLE `mf_user` (
  `userID` CHAR(35) NOT NULL,
  `siteID` CHAR(35) NULL DEFAULT NULL,
  `screenname` VARCHAR(50) NULL DEFAULT NULL,
  `avatarID` CHAR(35) NULL DEFAULT NULL,
  `avatarFileType` VARCHAR(5) NULL DEFAULT NULL,
  `redoAvatar` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
  `threadCounter` INT(10) UNSIGNED NOT NULL DEFAULT 0,
  `lastPostID` CHAR(35) NULL DEFAULT NULL,
  `lastThreadID` CHAR(35) NULL DEFAULT NULL,
  `adminMessage` TEXT NULL,
  `isConfirmed` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
  `isPrivate` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1,
  `isPostBlocked` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
  `isBlocked` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
  `doShowOnline` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1,
  `doReplyNotifications` TINYINT(3) UNSIGNED NULL DEFAULT 1,
  `postCounter` INT(10) UNSIGNED NOT NULL DEFAULT 0,
  `customValues` TEXT NULL,
  `dateLastAction` DATETIME NULL DEFAULT NULL,
  `dateLastLogin` DATETIME NULL DEFAULT NULL,
  `dateIsNewFrom` DATETIME NULL DEFAULT NULL,
  `remoteID` VARCHAR(35) NULL DEFAULT NULL,
  `dateCreate` DATETIME NOT NULL,
  `dateLastUpdate` DATETIME NOT NULL,
  PRIMARY KEY (`userID` ASC),
  KEY `siteID` (`siteID` ASC),
  KEY `remoteID` (`remoteID` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `mf_viewcounter`
--

CREATE TABLE `mf_viewcounter` (
  `forumID` CHAR(35) NOT NULL,
  `threadID` CHAR(35) NOT NULL,
  `views` INT(10) UNSIGNED NOT NULL DEFAULT 0,
  `dateCreate` DATETIME NOT NULL,
  `dateLastUpdate` DATETIME NOT NULL,
  PRIMARY KEY (`forumID` ASC,`threadID` ASC),
  KEY `idxThread` (`threadID` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Dumping data for table `mf_configuration`
--

INSERT INTO `mf_configuration` (`configurationID`,`siteID`,`name`,`description`,`isActive`,`restrictReadGroups`,`restrictContributeGroups`,`restrictModerateGroups`,`doRequireConfirmation`,`doAvatars`,`doClosed`,`allowAttachmentExtensions`,`doAttachments`,`isMaster`,`filesizeLimit`,`characterLimit`,`doInlineImageAttachments`,`imageWidthLimit`,`imageHeightLimit`,`remoteID`,`dateCreate`,`dateLastUpdate`) VALUES ('00000000-0000-0000-0000000000000001','default','Default','<br />\r\n',1,NULL,NULL,'RestrictAll',0,1,0,'jpg,png,gif,png,pdf',1,1,20000,1000,1,250,250,NULL,'2011-03-04 15:28:51','2011-06-09 13:02:35');

--
-- Dumping data for table `mf_displaytype`
--

INSERT INTO `mf_displaytype` (`displaytypeid`,`objectID`,`package`,`name`,`description`,`settings`,`isConfigurable`,`isActive`,`version`,`defaults`,`moduleID`,`dateCreate`,`dateLastUpdate`) VALUES ('63C75F85-6290-4547-AEB22844C1DFC84E','73D52102-0769-4E9A-82502DABFC844D49','forum','Forums',NULL,NULL,0,1,'1',NULL,'95119BB4-DD49-4353-B1FEB423BE7B9C0A','2011-03-29 15:28:33','2011-04-16 15:48:55');

--
-- Dumping data for table `mf_settings`
--

INSERT INTO `mf_settings` (`settingsID`,`siteID`,`isMaster`,`permissionGroups`,`themeID`,`threadsPerPage`,`postsPerPage`,`subscriptionLimit`,`allowedExtensions`,`deniedExtensions`,`filesizeLimit`,`avatarID`,`avatarResizeType`,`avatarQualityType`,`avatarAspectType`,`avatarCropType`,`userCacheSize`,`resetAvatar`,`doInit`,`activeWithinMinutes`,`searchMode`,`tempDir`,`baseTempDir`,`URLKey`,`remoteID`,`dateCreate`,`dateLastUpdate`) VALUES ('00000000-0000-0000-0000000000000002','default',0,'RestrictAll','00000000-0000-0000-0000000000000001',10,9,100,'jpg,gif,png,jpeg,pdf,txt,doc,xls,zip','html,htm,php,php2,php3,php4,php5,phtml,pwml,inc,asp,aspx,ascx,jsp,cfm,cfml,cfc,pl,bat,exe,com,dll,vbs,js,reg,cgi,htaccess,asis,sh,shtml,shtm,phtm',250,NULL,'CROPRESIZE','highestQuality','MaxAspectXY','BestXY',250,0,0,15,'simple','3B7E866E-97D7-4919-BFEA4E8C2641147A',NULL,'mf/',NULL,'2011-03-29 15:28:33','2011-06-07 16:25:02');

--
-- Dumping data for table `mf_theme`
--

INSERT INTO `mf_theme` (`themeID`,`name`,`packageName`,`avatarSmallWidth`,`avatarSmallHeight`,`avatarMediumWidth`,`avatarMediumHeight`,`avatarDimensionType`,`settings`,`defaultAvatar`,`isMaster`,`style`,`remoteID`,`dateCreate`,`dateLastUpdate`) VALUES ('00000000-0000-0000-0000000000000001','Preen','preen',125,125,250,250,'square',NULL,NULL,1,'TABLE',NULL,'2011-03-29 15:28:33','2011-03-29 15:28:33');
