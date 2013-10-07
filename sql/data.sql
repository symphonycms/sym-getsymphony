
-- *** STRUCTURE: `sym_cache` ***
DROP TABLE IF EXISTS `sym_cache`;
CREATE TABLE `sym_cache` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `creation` int(14) NOT NULL DEFAULT '0',
  `expiry` int(14) unsigned DEFAULT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `expiry` (`expiry`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** STRUCTURE: `sym_entries` ***
DROP TABLE IF EXISTS `sym_entries`;
CREATE TABLE `sym_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned NOT NULL,
  `creation_date` datetime NOT NULL,
  `creation_date_gmt` datetime NOT NULL,
  `modification_date` datetime NOT NULL,
  `modification_date_gmt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `section_id` (`section_id`),
  KEY `author_id` (`author_id`),
  KEY `creation_date` (`creation_date`),
  KEY `creation_date_gmt` (`creation_date_gmt`),
  KEY `modification_date` (`modification_date`),
  KEY `modification_date_gmt` (`modification_date_gmt`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_entries` ***
INSERT INTO `sym_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (1, 1, 2, '2013-08-21 21:31:24', '2013-08-21 11:31:24', '2013-08-21 21:31:24', '2013-08-21 11:31:24');
INSERT INTO `sym_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (2, 2, 2, '2013-08-21 21:32:00', '2013-08-21 11:32:00', '2013-08-21 21:39:09', '2013-08-21 11:39:09');
INSERT INTO `sym_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (3, 2, 2, '2013-08-21 21:39:55', '2013-08-21 11:39:55', '2013-08-21 21:39:55', '2013-08-21 11:39:55');
INSERT INTO `sym_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (4, 3, 2, '2013-08-21 21:41:20', '2013-08-21 11:41:20', '2013-08-21 21:42:24', '2013-08-21 11:42:24');
INSERT INTO `sym_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (5, 3, 2, '2013-08-21 21:42:37', '2013-08-21 11:42:37', '2013-08-21 21:42:37', '2013-08-21 11:42:37');
INSERT INTO `sym_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (6, 3, 2, '2013-08-21 21:43:01', '2013-08-21 11:43:01', '2013-08-21 21:43:01', '2013-08-21 11:43:01');
INSERT INTO `sym_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (7, 4, 2, '2013-10-07 11:30:51', '2013-10-07 01:30:51', '2013-10-07 11:31:50', '2013-10-07 01:31:50');

-- *** STRUCTURE: `sym_entries_data_1` ***
DROP TABLE IF EXISTS `sym_entries_data_1`;
CREATE TABLE `sym_entries_data_1` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_entries_data_1` ***
INSERT INTO `sym_entries_data_1` (`id`, `entry_id`, `handle`, `value`) VALUES (1, 1, 'symphony-factory', 'Symphony Factory');

-- *** STRUCTURE: `sym_entries_data_10` ***
DROP TABLE IF EXISTS `sym_entries_data_10`;
CREATE TABLE `sym_entries_data_10` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_entries_data_10` ***
INSERT INTO `sym_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (2, 4, 100, 100);
INSERT INTO `sym_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (3, 5, 200, 200);
INSERT INTO `sym_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (4, 6, 300, 300);

-- *** STRUCTURE: `sym_entries_data_11` ***
DROP TABLE IF EXISTS `sym_entries_data_11`;
CREATE TABLE `sym_entries_data_11` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_entries_data_11` ***
INSERT INTO `sym_entries_data_11` (`id`, `entry_id`, `handle`, `value`) VALUES (2, 4, 'nils', 'nils');
INSERT INTO `sym_entries_data_11` (`id`, `entry_id`, `handle`, `value`) VALUES (3, 5, 'remie', 'remie');
INSERT INTO `sym_entries_data_11` (`id`, `entry_id`, `handle`, `value`) VALUES (4, 6, 'johanna', 'johanna');

-- *** STRUCTURE: `sym_entries_data_12` ***
DROP TABLE IF EXISTS `sym_entries_data_12`;
CREATE TABLE `sym_entries_data_12` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_entries_data_12` ***
INSERT INTO `sym_entries_data_12` (`id`, `entry_id`, `handle`, `value`) VALUES (2, 4, 'nils-hoerrmann', 'Nils Hörrmann');
INSERT INTO `sym_entries_data_12` (`id`, `entry_id`, `handle`, `value`) VALUES (3, 5, 'remie', 'Remie');
INSERT INTO `sym_entries_data_12` (`id`, `entry_id`, `handle`, `value`) VALUES (4, 6, 'johanna', 'Johanna');

-- *** STRUCTURE: `sym_entries_data_13` ***
DROP TABLE IF EXISTS `sym_entries_data_13`;
CREATE TABLE `sym_entries_data_13` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_entries_data_13` ***
INSERT INTO `sym_entries_data_13` (`id`, `entry_id`, `handle`, `value`) VALUES (1, 4, 'germany', 'Germany');
INSERT INTO `sym_entries_data_13` (`id`, `entry_id`, `handle`, `value`) VALUES (2, 5, 'usa', 'USA');
INSERT INTO `sym_entries_data_13` (`id`, `entry_id`, `handle`, `value`) VALUES (3, 6, 'germany', 'Germany');

-- *** STRUCTURE: `sym_entries_data_14` ***
DROP TABLE IF EXISTS `sym_entries_data_14`;
CREATE TABLE `sym_entries_data_14` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_entries_data_14` ***
INSERT INTO `sym_entries_data_14` (`id`, `entry_id`, `relation_id`) VALUES (1, 4, 0);
INSERT INTO `sym_entries_data_14` (`id`, `entry_id`, `relation_id`) VALUES (2, 5, 0);
INSERT INTO `sym_entries_data_14` (`id`, `entry_id`, `relation_id`) VALUES (3, 6, 1);

-- *** STRUCTURE: `sym_entries_data_15` ***
DROP TABLE IF EXISTS `sym_entries_data_15`;
CREATE TABLE `sym_entries_data_15` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_entries_data_15` ***
INSERT INTO `sym_entries_data_15` (`id`, `entry_id`, `handle`, `value`) VALUES (2, 7, 'timespan-format', 'Timespan format');

-- *** STRUCTURE: `sym_entries_data_16` ***
DROP TABLE IF EXISTS `sym_entries_data_16`;
CREATE TABLE `sym_entries_data_16` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_entries_data_16` ***
INSERT INTO `sym_entries_data_16` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (2, 7, '<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<!--\r\n\r\nDrop me a note @kirkstrobeck if you use this, I\'d like to see it in the wild :P\r\n\r\n\r\nExample XSL generated from https://github.com/hananils/datetime\r\n\r\n	<date timeline=\"1\" type=\"range\">\r\n		<start iso=\"2012-11-17T13:00:00-08:00\" time=\"13:00\" weekday=\"6\" offset=\"-0800\">2012-11-17</start>\r\n		<end iso=\"2012-07-29T08:00:00-07:00\" time=\"08:00\" weekday=\"7\" offset=\"-0700\">2012-07-29</end>\r\n	</date>\r\n\r\n\r\nCall using\r\n\r\n	<xsl:call-template name=\"timespan-format\">\r\n		<xsl:with-param name=\"date\" select=\"date\" />\r\n	</xsl:call-template>\r\n\r\n\r\nExamples are ..\r\n\r\n	- Saturday, Nov. 17 at 10am\r\n	- Saturday, Nov. 17 from 1-2pm\r\n	- Saturday, Nov. 17 from 10am-2:30pm\r\n	- Saturday, Nov. 17th at 10am - Monday, the 19th at 11am\r\n	- Saturday, Nov. 17 at 1pm - Sunday, Jul. 29 at 8am\r\n\r\n-->\r\n\r\n<xsl:template name=\"timespan-format\">\r\n\r\n	<xsl:param name=\"date\" />\r\n\r\n	<xsl:for-each select=\"$date\">\r\n		<xsl:choose>\r\n			<xsl:when test=\"start and end\">\r\n				<xsl:variable name=\"start-month\">\r\n					<xsl:call-template name=\"format-date\">\r\n						<xsl:with-param name=\"date\" select=\"start/@iso\" />\r\n						<xsl:with-param name=\"format\" select=\"\'%m;\'\" />\r\n					</xsl:call-template>\r\n				</xsl:variable>\r\n				<xsl:variable name=\"end-month\">\r\n					<xsl:call-template name=\"format-date\">\r\n						<xsl:with-param name=\"date\" select=\"end/@iso\" />\r\n						<xsl:with-param name=\"format\" select=\"\'%m;\'\" />\r\n					</xsl:call-template>\r\n				</xsl:variable>\r\n				<xsl:variable name=\"start-day\">\r\n					<xsl:call-template name=\"format-date\">\r\n						<xsl:with-param name=\"date\" select=\"start/@iso\" />\r\n						<xsl:with-param name=\"format\" select=\"\'%d;\'\" />\r\n					</xsl:call-template>\r\n				</xsl:variable>\r\n				<xsl:variable name=\"end-day\">\r\n					<xsl:call-template name=\"format-date\">\r\n						<xsl:with-param name=\"date\" select=\"end/@iso\" />\r\n						<xsl:with-param name=\"format\" select=\"\'%d;\'\" />\r\n					</xsl:call-template>\r\n				</xsl:variable>\r\n				<xsl:variable name=\"start-ampm\">\r\n					<xsl:call-template name=\"format-date\">\r\n						<xsl:with-param name=\"date\" select=\"start/@iso\" />\r\n						<xsl:with-param name=\"format\" select=\"\'#ts;\'\" />\r\n					</xsl:call-template>\r\n				</xsl:variable>\r\n				<xsl:variable name=\"end-ampm\">\r\n					<xsl:call-template name=\"format-date\">\r\n						<xsl:with-param name=\"date\" select=\"end/@iso\" />\r\n						<xsl:with-param name=\"format\" select=\"\'#ts;\'\" />\r\n					</xsl:call-template>\r\n				</xsl:variable>\r\n				<xsl:choose>\r\n					<xsl:when test=\"$start-day = $end-day\">\r\n						<xsl:call-template name=\"format-date\">\r\n							<xsl:with-param name=\"date\" select=\"start/@iso\" />\r\n							<xsl:with-param name=\"format\" select=\"\'%d+;, %m-;. %d;%ds;\'\" />\r\n						</xsl:call-template>\r\n						<xsl:text> from </xsl:text>\r\n						<xsl:call-template name=\"timespan-format-time\">\r\n							<xsl:with-param name=\"date\" select=\"start/@iso\" />\r\n						</xsl:call-template>\r\n						<xsl:if test=\"not($start-ampm = $end-ampm)\">\r\n							<xsl:value-of select=\"$start-ampm\" />\r\n						</xsl:if>\r\n						<xsl:if test=\"end\">\r\n							<xsl:text>-</xsl:text>\r\n							<xsl:call-template name=\"timespan-format-time\">\r\n								<xsl:with-param name=\"date\" select=\"end/@iso\" />\r\n							</xsl:call-template>\r\n						</xsl:if>\r\n						<xsl:value-of select=\"$end-ampm\" />\r\n					</xsl:when>\r\n					<xsl:otherwise>\r\n						<xsl:call-template name=\"timespan-format-single-datetime\">\r\n							<xsl:with-param name=\"date\" select=\"start\" />\r\n						</xsl:call-template>\r\n						<xsl:text> - </xsl:text>\r\n						<xsl:choose>\r\n							<xsl:when test=\"$start-month = $end-month\">\r\n								<xsl:call-template name=\"timespan-format-single-datetime\">\r\n									<xsl:with-param name=\"date\" select=\"end\" />\r\n									<xsl:with-param name=\"no-month\" select=\"true()\" />\r\n								</xsl:call-template>\r\n							</xsl:when>\r\n							<xsl:otherwise>\r\n								<xsl:call-template name=\"timespan-format-single-datetime\">\r\n									<xsl:with-param name=\"date\" select=\"end\" />\r\n								</xsl:call-template>\r\n							</xsl:otherwise>\r\n						</xsl:choose>\r\n					</xsl:otherwise>\r\n				</xsl:choose>\r\n			</xsl:when>\r\n			<xsl:otherwise>\r\n				<xsl:call-template name=\"timespan-format-single-datetime\">\r\n					<xsl:with-param name=\"date\" select=\"start\" />\r\n				</xsl:call-template>\r\n			</xsl:otherwise>\r\n		</xsl:choose>\r\n	</xsl:for-each>\r\n\r\n</xsl:template>\r\n\r\n\r\n<xsl:template name=\"timespan-format-single-datetime\">\r\n\r\n	<xsl:param name=\"date\" /> <!-- start or end -->\r\n	<xsl:param name=\"no-month\" select=\"false()\" />\r\n\r\n	<xsl:for-each select=\"$date\">\r\n		<xsl:choose>\r\n			<xsl:when test=\"$no-month\">\r\n				<xsl:call-template name=\"format-date\">\r\n					<xsl:with-param name=\"date\" select=\"@iso\" />\r\n					<xsl:with-param name=\"format\" select=\"\'%d+;, the %d;%ds;\'\" />\r\n				</xsl:call-template>\r\n			</xsl:when>\r\n			<xsl:otherwise>\r\n				<xsl:call-template name=\"format-date\">\r\n					<xsl:with-param name=\"date\" select=\"@iso\" />\r\n					<xsl:with-param name=\"format\" select=\"\'%d+;, %m-;. %d;%ds;\'\" />\r\n				</xsl:call-template>\r\n			</xsl:otherwise>\r\n		</xsl:choose>\r\n		<xsl:text> at </xsl:text>\r\n		<xsl:call-template name=\"timespan-format-time\">\r\n			<xsl:with-param name=\"date\" select=\"@iso\" />\r\n		</xsl:call-template>\r\n		<xsl:text> </xsl:text>\r\n		<xsl:call-template name=\"format-date\">\r\n			<xsl:with-param name=\"date\" select=\"@iso\" />\r\n			<xsl:with-param name=\"format\" select=\"\'#ts;\'\" />\r\n		</xsl:call-template>\r\n	</xsl:for-each>\r\n\r\n</xsl:template>\r\n\r\n\r\n<xsl:template name=\"timespan-format-time\">\r\n\r\n	<xsl:param name=\"date\" /> <!-- iso -->\r\n\r\n	<xsl:variable name=\"minutes\">\r\n		<xsl:call-template name=\"format-date\">\r\n			<xsl:with-param name=\"date\" select=\"$date\" />\r\n			<xsl:with-param name=\"format\" select=\"\'#0m;\'\" />\r\n		</xsl:call-template>\r\n	</xsl:variable>\r\n	<xsl:choose>\r\n		<xsl:when test=\"$minutes = \'00\'\">\r\n			<xsl:call-template name=\"format-date\">\r\n				<xsl:with-param name=\"date\" select=\"$date\" />\r\n				<xsl:with-param name=\"format\" select=\"\'#h;\'\" />\r\n			</xsl:call-template>\r\n		</xsl:when>\r\n		<xsl:otherwise>\r\n			<xsl:call-template name=\"format-date\">\r\n				<xsl:with-param name=\"date\" select=\"$date\" />\r\n				<xsl:with-param name=\"format\" select=\"\'#h;:#0m;\'\" />\r\n			</xsl:call-template>\r\n		</xsl:otherwise>\r\n	</xsl:choose>\r\n\r\n</xsl:template>\r\n\r\n\r\n</xsl:stylesheet>', NULL);

-- *** STRUCTURE: `sym_entries_data_17` ***
DROP TABLE IF EXISTS `sym_entries_data_17`;
CREATE TABLE `sym_entries_data_17` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_entries_data_17` ***
INSERT INTO `sym_entries_data_17` (`id`, `entry_id`, `handle`, `value`) VALUES (1, 7, 'date', 'date');

-- *** STRUCTURE: `sym_entries_data_18` ***
DROP TABLE IF EXISTS `sym_entries_data_18`;
CREATE TABLE `sym_entries_data_18` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_entries_data_18` ***
INSERT INTO `sym_entries_data_18` (`id`, `entry_id`, `handle`, `value`) VALUES (2, 7, 200, 200);

-- *** STRUCTURE: `sym_entries_data_19` ***
DROP TABLE IF EXISTS `sym_entries_data_19`;
CREATE TABLE `sym_entries_data_19` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_entries_data_19` ***
INSERT INTO `sym_entries_data_19` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (1, 7, 'This utility takes an ISO start time and and an optional end time using this extension\r\nhttps://github.com/hananils/datetime\r\n\r\nand formats the date and time in the easiest to understand format.\r\n\r\nExamples are ..\r\n\r\nSaturday, Nov. 17 at 10am\r\nSaturday, Nov. 17 from 1-2pm\r\nSaturday, Nov. 17 from 10am-2:30pm\r\nSaturday, Nov. 17th at 10am - Monday, the 19th at 11am\r\nSaturday, Nov. 17 at 1pm - Sunday, Jul. 29 at 8am', '<p>This utility takes an ISO start time and and an optional end time using this extension\nhttps://github.com/hananils/datetime</p>\n\n<p>and formats the date and time in the easiest to understand format.</p>\n\n<p>Examples are ..</p>\n\n<p>Saturday, Nov. 17 at 10am\nSaturday, Nov. 17 from 1-2pm\nSaturday, Nov. 17 from 10am-2:30pm\nSaturday, Nov. 17th at 10am - Monday, the 19th at 11am\nSaturday, Nov. 17 at 1pm - Sunday, Jul. 29 at 8am</p>\n');

-- *** STRUCTURE: `sym_entries_data_2` ***
DROP TABLE IF EXISTS `sym_entries_data_2`;
CREATE TABLE `sym_entries_data_2` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_entries_data_2` ***
INSERT INTO `sym_entries_data_2` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (1, 1, '# Symphony Network evolving\r\n\r\nThe network is growing...', '<h1>Symphony Network evolving</h1>\n\n<p>The network is growing&#8230;</p>\n');

-- *** STRUCTURE: `sym_entries_data_3` ***
DROP TABLE IF EXISTS `sym_entries_data_3`;
CREATE TABLE `sym_entries_data_3` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_entries_data_3` ***
INSERT INTO `sym_entries_data_3` (`id`, `entry_id`, `handle`, `value`) VALUES (1, 1, 'open', 'Open');

-- *** STRUCTURE: `sym_entries_data_4` ***
DROP TABLE IF EXISTS `sym_entries_data_4`;
CREATE TABLE `sym_entries_data_4` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_entries_data_4` ***
INSERT INTO `sym_entries_data_4` (`id`, `entry_id`, `handle`, `value`) VALUES (1, 1, 100, 100);

-- *** STRUCTURE: `sym_entries_data_5` ***
DROP TABLE IF EXISTS `sym_entries_data_5`;
CREATE TABLE `sym_entries_data_5` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_entries_data_5` ***
INSERT INTO `sym_entries_data_5` (`id`, `entry_id`, `value`) VALUES (1, 1, 'no');

-- *** STRUCTURE: `sym_entries_data_6` ***
DROP TABLE IF EXISTS `sym_entries_data_6`;
CREATE TABLE `sym_entries_data_6` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_entries_data_6` ***
INSERT INTO `sym_entries_data_6` (`id`, `entry_id`, `handle`, `value`) VALUES (1, 1, 'discussion', 'Discussion');

-- *** STRUCTURE: `sym_entries_data_7` ***
DROP TABLE IF EXISTS `sym_entries_data_7`;
CREATE TABLE `sym_entries_data_7` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_entries_data_7` ***
INSERT INTO `sym_entries_data_7` (`id`, `entry_id`, `handle`, `value`) VALUES (2, 2, 200, 200);
INSERT INTO `sym_entries_data_7` (`id`, `entry_id`, `handle`, `value`) VALUES (3, 3, 300, 300);

-- *** STRUCTURE: `sym_entries_data_8` ***
DROP TABLE IF EXISTS `sym_entries_data_8`;
CREATE TABLE `sym_entries_data_8` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_entries_data_8` ***
INSERT INTO `sym_entries_data_8` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (2, 2, 'Thank god! This is actually what I need :) Hurray for you both!', '<p>Thank god! This is actually what I need :) Hurray for you both!</p>\n');
INSERT INTO `sym_entries_data_8` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (3, 3, 'This is exciting! Thanks to everyone who has already donated to the project, especially to \"Soario\":http://soario.com for the generous kick off', '<p>This is exciting! Thanks to everyone who has already donated to the project, especially to \"Soario\":http://soario.com for the generous kick off</p>\n');

-- *** STRUCTURE: `sym_entries_data_9` ***
DROP TABLE IF EXISTS `sym_entries_data_9`;
CREATE TABLE `sym_entries_data_9` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_entries_data_9` ***
INSERT INTO `sym_entries_data_9` (`id`, `entry_id`, `relation_id`) VALUES (2, 2, 1);
INSERT INTO `sym_entries_data_9` (`id`, `entry_id`, `relation_id`) VALUES (3, 3, 1);

-- *** STRUCTURE: `sym_extensions` ***
DROP TABLE IF EXISTS `sym_extensions`;
CREATE TABLE `sym_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enabled',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_extensions` ***
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (1, 'debugdevkit', 'enabled', '1.2.4');
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (2, 'export_ensemble', 'enabled', '2.0.3');
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (3, 'jit_image_manipulation', 'enabled', 1.19);
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (4, 'maintenance_mode', 'enabled', 1.7);
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (5, 'markdown', 'enabled', 1.17);
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (6, 'profiledevkit', 'enabled', 1.3);
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (7, 'selectbox_link_field', 'enabled', 1.28);
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (8, 'xssfilter', 'enabled', 1.2);
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (9, 'dump_db', 'enabled', 1.10);
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (10, 'publish_tabs', 'enabled', '1.1.2');
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (12, 'uniondatasource', 'enabled', '1.0.4');

-- *** STRUCTURE: `sym_extensions_delegates` ***
DROP TABLE IF EXISTS `sym_extensions_delegates`;
CREATE TABLE `sym_extensions_delegates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` int(11) NOT NULL,
  `page` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `delegate` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `callback` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_id` (`extension_id`),
  KEY `page` (`page`),
  KEY `delegate` (`delegate`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_extensions_delegates` ***
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (62, 1, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (61, 1, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (63, 2, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (71, 4, '/frontend/', 'FrontendPrePageResolve', '__checkForMaintenanceMode');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (70, 4, '/blueprints/pages/', 'AppendPageContent', '__appendType');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (69, 4, '/backend/', 'AppendPageAlert', '__appendAlert');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (74, 6, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (73, 6, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (60, 8, '/frontend/', 'EventPreSaveFilter', 'eventPreSaveFilter');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (59, 8, '/blueprints/events/edit/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (41, 9, '/backend/', 'InitaliseAdminPageHead', 'initaliseAdminPageHead');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (40, 9, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (65, 3, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (67, 4, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (68, 4, '/system/preferences/', 'CustomActions', '__toggleMaintenanceMode');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (42, 9, '/backend/', 'AppendPageAlert', 'appendAlert');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (64, 3, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (66, 4, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (58, 8, '/blueprints/events/new/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (72, 4, '/frontend/', 'FrontendParamsResolve', '__addParam');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (75, 10, '/backend/', 'InitaliseAdminPageHead', 'initializeAdmin');

-- *** STRUCTURE: `sym_fields` ***
DROP TABLE IF EXISTS `sym_fields`;
CREATE TABLE `sym_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `element_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `parent_section` int(11) NOT NULL DEFAULT '0',
  `required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `sortorder` int(11) NOT NULL DEFAULT '1',
  `location` enum('main','sidebar') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'main',
  `show_column` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `index` (`element_name`,`type`,`parent_section`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_fields` ***
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (1, 'Topic', 'topic', 'input', 1, 'yes', 0, 'main', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (2, 'Content', 'content', 'textarea', 1, 'yes', 1, 'main', 'no');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (3, 'State', 'state', 'select', 1, 'yes', 2, 'sidebar', 'no');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (4, 'Author', 'author', 'input', 1, 'no', 4, 'sidebar', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (5, 'Is this topic pinned?', 'pinned', 'checkbox', 1, 'no', 5, 'sidebar', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (6, 'Type', 'type', 'select', 1, 'yes', 3, 'sidebar', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (7, 'Author', 'author', 'input', 2, 'no', 0, 'sidebar', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (8, 'Comment', 'comment', 'textarea', 2, 'no', 1, 'main', 'no');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (9, 'Related', 'related', 'selectbox_link', 2, 'yes', 2, 'sidebar', 'no');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (10, 'Member ID', 'member-id', 'input', 3, 'no', 0, 'main', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (11, 'Username', 'username', 'input', 3, 'no', 1, 'main', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (12, 'Name', 'name', 'input', 3, 'no', 2, 'main', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (13, 'Country', 'country', 'input', 3, 'no', 3, 'sidebar', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (14, 'Starred Stream', 'starred-stream', 'selectbox_link', 3, 'no', 4, 'sidebar', 'no');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (15, 'Name', 'name', 'input', 4, 'no', 0, 'main', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (16, 'Content', 'content', 'textarea', 4, 'no', 1, 'main', 'no');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (17, 'Tags', 'tags', 'taglist', 4, 'no', 3, 'sidebar', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (18, 'Author', 'author', 'input', 4, 'no', 4, 'sidebar', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (19, 'Description', 'description', 'textarea', 4, 'no', 2, 'sidebar', 'no');

-- *** STRUCTURE: `sym_fields_author` ***
DROP TABLE IF EXISTS `sym_fields_author`;
CREATE TABLE `sym_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `author_types` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_fields_author` ***

-- *** STRUCTURE: `sym_fields_checkbox` ***
DROP TABLE IF EXISTS `sym_fields_checkbox`;
CREATE TABLE `sym_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'on',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_fields_checkbox` ***
INSERT INTO `sym_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (6, 5, 'off', NULL);

-- *** STRUCTURE: `sym_fields_date` ***
DROP TABLE IF EXISTS `sym_fields_date`;
CREATE TABLE `sym_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_fields_date` ***

-- *** STRUCTURE: `sym_fields_input` ***
DROP TABLE IF EXISTS `sym_fields_input`;
CREATE TABLE `sym_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_fields_input` ***
INSERT INTO `sym_fields_input` (`id`, `field_id`, `validator`) VALUES (27, 1, NULL);
INSERT INTO `sym_fields_input` (`id`, `field_id`, `validator`) VALUES (28, 4, '/^-?(?:\\d+(?:\\.\\d+)?|\\.\\d+)$/i');
INSERT INTO `sym_fields_input` (`id`, `field_id`, `validator`) VALUES (32, 7, NULL);
INSERT INTO `sym_fields_input` (`id`, `field_id`, `validator`) VALUES (17, 10, NULL);
INSERT INTO `sym_fields_input` (`id`, `field_id`, `validator`) VALUES (18, 11, NULL);
INSERT INTO `sym_fields_input` (`id`, `field_id`, `validator`) VALUES (19, 12, NULL);
INSERT INTO `sym_fields_input` (`id`, `field_id`, `validator`) VALUES (20, 13, NULL);
INSERT INTO `sym_fields_input` (`id`, `field_id`, `validator`) VALUES (33, 15, NULL);
INSERT INTO `sym_fields_input` (`id`, `field_id`, `validator`) VALUES (34, 18, NULL);

-- *** STRUCTURE: `sym_fields_publish_tabs` ***
DROP TABLE IF EXISTS `sym_fields_publish_tabs`;
CREATE TABLE `sym_fields_publish_tabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- *** DATA: `sym_fields_publish_tabs` ***

-- *** STRUCTURE: `sym_fields_select` ***
DROP TABLE IF EXISTS `sym_fields_select`;
CREATE TABLE `sym_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `sort_options` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `static_options` text COLLATE utf8_unicode_ci,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_fields_select` ***
INSERT INTO `sym_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (11, 3, 'no', 'no', 'yes', 'Open, Locked', NULL);
INSERT INTO `sym_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES (12, 6, 'no', 'no', 'yes', 'Discussion, Showcase, Extension', NULL);

-- *** STRUCTURE: `sym_fields_selectbox_link` ***
DROP TABLE IF EXISTS `sym_fields_selectbox_link`;
CREATE TABLE `sym_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `related_field_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  `hide_when_prepopulated` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_fields_selectbox_link` ***
INSERT INTO `sym_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`, `hide_when_prepopulated`) VALUES (5, 14, 'yes', 'no', 1, 20, 'no');
INSERT INTO `sym_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`, `hide_when_prepopulated`) VALUES (7, 9, 'no', 'yes', '1,15', 20, 'yes');

-- *** STRUCTURE: `sym_fields_taglist` ***
DROP TABLE IF EXISTS `sym_fields_taglist`;
CREATE TABLE `sym_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_populate_source` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_fields_taglist` ***
INSERT INTO `sym_fields_taglist` (`id`, `field_id`, `validator`, `pre_populate_source`) VALUES (3, 17, NULL, 'existing');

-- *** STRUCTURE: `sym_fields_textarea` ***
DROP TABLE IF EXISTS `sym_fields_textarea`;
CREATE TABLE `sym_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_fields_textarea` ***
INSERT INTO `sym_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (10, 2, 'markdown_with_purifier', 15);
INSERT INTO `sym_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (13, 8, 'markdown_with_purifier', 15);
INSERT INTO `sym_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (14, 16, NULL, 15);
INSERT INTO `sym_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (15, 19, 'markdown_with_purifier', 15);

-- *** STRUCTURE: `sym_fields_upload` ***
DROP TABLE IF EXISTS `sym_fields_upload`;
CREATE TABLE `sym_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_fields_upload` ***

-- *** STRUCTURE: `sym_pages` ***
DROP TABLE IF EXISTS `sym_pages`;
CREATE TABLE `sym_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_sources` text COLLATE utf8_unicode_ci,
  `events` text COLLATE utf8_unicode_ci,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_pages` ***
INSERT INTO `sym_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (1, NULL, 'Home', 'home', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sym_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (2, NULL, 'Stream', 'stream', NULL, 'filter-handle', 'complete_stream,read_member_by_id', NULL, 2);
INSERT INTO `sym_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (3, NULL, 'Discussions', 'discussions', NULL, NULL, NULL, NULL, 8);
INSERT INTO `sym_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (4, NULL, 'Questions', 'questions', NULL, NULL, NULL, NULL, 9);
INSERT INTO `sym_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (5, NULL, 'Blog', 'blog', NULL, NULL, NULL, NULL, 10);
INSERT INTO `sym_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (6, NULL, 'Showcase', 'showcase', NULL, NULL, NULL, NULL, 11);
INSERT INTO `sym_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (7, NULL, 'Events', 'events', NULL, NULL, NULL, NULL, 12);
INSERT INTO `sym_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (8, NULL, 'About', 'about', NULL, NULL, NULL, NULL, 13);
INSERT INTO `sym_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (9, NULL, 'Maintenance', 'maintenance', NULL, NULL, NULL, NULL, 14);
INSERT INTO `sym_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (10, 2, 'Create', 'create', 'stream', NULL, 'read_member_by_id', 'create_stream', 4);
INSERT INTO `sym_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (12, 2, 'Read', 'read', 'stream', 'stream-id/stream-handle', 'comments_by_id,read_member_by_id,stream_by_id', 'create_comment', 3);
INSERT INTO `sym_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (14, NULL, 'Utility', 'utility', NULL, NULL, 'utilities', NULL, 5);
INSERT INTO `sym_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (16, 14, 'Create', 'create', 'utility', NULL, NULL, 'create_utility', 7);
INSERT INTO `sym_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (15, 14, 'Read', 'read', 'utility', 'utility-id/utility-handle', 'comments_by_id,utility_by_id', 'create_comment', 6);

-- *** STRUCTURE: `sym_pages_types` ***
DROP TABLE IF EXISTS `sym_pages_types`;
CREATE TABLE `sym_pages_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_pages_types` ***
INSERT INTO `sym_pages_types` (`id`, `page_id`, `type`) VALUES (2, 1, 'index');
INSERT INTO `sym_pages_types` (`id`, `page_id`, `type`) VALUES (3, 9, 'maintenance');

-- *** STRUCTURE: `sym_sections` ***
DROP TABLE IF EXISTS `sym_sections`;
CREATE TABLE `sym_sections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `hidden` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `navigation_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Content',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_sections` ***
INSERT INTO `sym_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `navigation_group`) VALUES (1, 'Stream', 'stream', 1, 'no', 'Stream');
INSERT INTO `sym_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `navigation_group`) VALUES (2, 'Comments', 'comments', 2, 'no', 'Content');
INSERT INTO `sym_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `navigation_group`) VALUES (3, 'Members', 'members', 3, 'no', 'Members (Temporary..)');
INSERT INTO `sym_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `navigation_group`) VALUES (4, 'Utilities', 'utilities', 4, 'no', 'Stream');

-- *** STRUCTURE: `sym_sections_association` ***
DROP TABLE IF EXISTS `sym_sections_association`;
CREATE TABLE `sym_sections_association` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_section_id` int(11) unsigned NOT NULL,
  `parent_section_field_id` int(11) unsigned DEFAULT NULL,
  `child_section_id` int(11) unsigned NOT NULL,
  `child_section_field_id` int(11) unsigned NOT NULL,
  `hide_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `parent_section_id` (`parent_section_id`,`child_section_id`,`child_section_field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_sections_association` ***
INSERT INTO `sym_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (9, 4, 15, 2, 9, 'no');
INSERT INTO `sym_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (5, 1, 1, 3, 14, 'yes');
INSERT INTO `sym_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (8, 1, 1, 2, 9, 'no');
