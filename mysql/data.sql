/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table wp_commentmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_commentmeta`;

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_comments`;

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_links`;

CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_options`;

CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`)
VALUES
	(1,'siteurl','http://localhost','yes'),
	(2,'home','http://localhost','yes'),
	(3,'blogname','WooCommerce POS Dev','yes'),
	(4,'blogdescription','Just another WordPress site','yes'),
	(5,'users_can_register','0','yes'),
	(6,'admin_email','support@wcpos.com','yes'),
	(7,'start_of_week','1','yes'),
	(8,'use_balanceTags','0','yes'),
	(9,'use_smilies','1','yes'),
	(10,'require_name_email','1','yes'),
	(11,'comments_notify','1','yes'),
	(12,'posts_per_rss','10','yes'),
	(13,'rss_use_excerpt','0','yes'),
	(14,'mailserver_url','mail.example.com','yes'),
	(15,'mailserver_login','login@example.com','yes'),
	(16,'mailserver_pass','password','yes'),
	(17,'mailserver_port','110','yes'),
	(18,'default_category','1','yes'),
	(19,'default_comment_status','open','yes'),
	(20,'default_ping_status','open','yes'),
	(21,'default_pingback_flag','1','yes'),
	(22,'posts_per_page','10','yes'),
	(23,'date_format','F j, Y','yes'),
	(24,'time_format','g:i a','yes'),
	(25,'links_updated_date_format','F j, Y g:i a','yes'),
	(26,'comment_moderation','0','yes'),
	(27,'moderation_notify','1','yes'),
	(28,'permalink_structure','/%year%/%monthnum%/%day%/%postname%/','yes'),
	(29,'rewrite_rules','a:195:{s:24:\"^wc-auth/v([1]{1})/(.*)?\";s:63:\"index.php?wc-auth-version=$matches[1]&wc-auth-route=$matches[2]\";s:22:\"^wc-api/v([1-3]{1})/?$\";s:51:\"index.php?wc-api-version=$matches[1]&wc-api-route=/\";s:24:\"^wc-api/v([1-3]{1})(.*)?\";s:61:\"index.php?wc-api-version=$matches[1]&wc-api-route=$matches[2]\";s:7:\"shop/?$\";s:27:\"index.php?post_type=product\";s:37:\"shop/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:32:\"shop/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:24:\"shop/page/([0-9]{1,})/?$\";s:45:\"index.php?post_type=product&paged=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:32:\"category/(.+?)/wc-api(/(.*))?/?$\";s:54:\"index.php?category_name=$matches[1]&wc-api=$matches[3]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:29:\"tag/([^/]+)/wc-api(/(.*))?/?$\";s:44:\"index.php?tag=$matches[1]&wc-api=$matches[3]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:55:\"product-category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:50:\"product-category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:31:\"product-category/(.+?)/embed/?$\";s:44:\"index.php?product_cat=$matches[1]&embed=true\";s:43:\"product-category/(.+?)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_cat=$matches[1]&paged=$matches[2]\";s:25:\"product-category/(.+?)/?$\";s:33:\"index.php?product_cat=$matches[1]\";s:52:\"product-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:47:\"product-tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:28:\"product-tag/([^/]+)/embed/?$\";s:44:\"index.php?product_tag=$matches[1]&embed=true\";s:40:\"product-tag/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_tag=$matches[1]&paged=$matches[2]\";s:22:\"product-tag/([^/]+)/?$\";s:33:\"index.php?product_tag=$matches[1]\";s:35:\"product/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"product/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"product/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"product/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"product/([^/]+)/embed/?$\";s:40:\"index.php?product=$matches[1]&embed=true\";s:28:\"product/([^/]+)/trackback/?$\";s:34:\"index.php?product=$matches[1]&tb=1\";s:48:\"product/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?product=$matches[1]&feed=$matches[2]\";s:43:\"product/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?product=$matches[1]&feed=$matches[2]\";s:36:\"product/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&paged=$matches[2]\";s:43:\"product/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&cpage=$matches[2]\";s:33:\"product/([^/]+)/wc-api(/(.*))?/?$\";s:48:\"index.php?product=$matches[1]&wc-api=$matches[3]\";s:39:\"product/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:50:\"product/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:32:\"product/([^/]+)(?:/([0-9]+))?/?$\";s:46:\"index.php?product=$matches[1]&page=$matches[2]\";s:24:\"product/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"product/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"product/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"product/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:45:\"product_variation/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:55:\"product_variation/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:75:\"product_variation/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:70:\"product_variation/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:70:\"product_variation/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:51:\"product_variation/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:34:\"product_variation/([^/]+)/embed/?$\";s:50:\"index.php?product_variation=$matches[1]&embed=true\";s:38:\"product_variation/([^/]+)/trackback/?$\";s:44:\"index.php?product_variation=$matches[1]&tb=1\";s:46:\"product_variation/([^/]+)/page/?([0-9]{1,})/?$\";s:57:\"index.php?product_variation=$matches[1]&paged=$matches[2]\";s:53:\"product_variation/([^/]+)/comment-page-([0-9]{1,})/?$\";s:57:\"index.php?product_variation=$matches[1]&cpage=$matches[2]\";s:43:\"product_variation/([^/]+)/wc-api(/(.*))?/?$\";s:58:\"index.php?product_variation=$matches[1]&wc-api=$matches[3]\";s:49:\"product_variation/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:60:\"product_variation/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\"product_variation/([^/]+)(?:/([0-9]+))?/?$\";s:56:\"index.php?product_variation=$matches[1]&page=$matches[2]\";s:34:\"product_variation/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"product_variation/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"product_variation/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"product_variation/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"product_variation/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"product_variation/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:45:\"shop_order_refund/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:55:\"shop_order_refund/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:75:\"shop_order_refund/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:70:\"shop_order_refund/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:70:\"shop_order_refund/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:51:\"shop_order_refund/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:34:\"shop_order_refund/([^/]+)/embed/?$\";s:50:\"index.php?shop_order_refund=$matches[1]&embed=true\";s:38:\"shop_order_refund/([^/]+)/trackback/?$\";s:44:\"index.php?shop_order_refund=$matches[1]&tb=1\";s:46:\"shop_order_refund/([^/]+)/page/?([0-9]{1,})/?$\";s:57:\"index.php?shop_order_refund=$matches[1]&paged=$matches[2]\";s:53:\"shop_order_refund/([^/]+)/comment-page-([0-9]{1,})/?$\";s:57:\"index.php?shop_order_refund=$matches[1]&cpage=$matches[2]\";s:43:\"shop_order_refund/([^/]+)/wc-api(/(.*))?/?$\";s:58:\"index.php?shop_order_refund=$matches[1]&wc-api=$matches[3]\";s:49:\"shop_order_refund/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:60:\"shop_order_refund/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\"shop_order_refund/([^/]+)(?:/([0-9]+))?/?$\";s:56:\"index.php?shop_order_refund=$matches[1]&page=$matches[2]\";s:34:\"shop_order_refund/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"shop_order_refund/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"shop_order_refund/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"shop_order_refund/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"shop_order_refund/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"shop_order_refund/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:17:\"wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:26:\"comments/wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:29:\"search/(.+)/wc-api(/(.*))?/?$\";s:42:\"index.php?s=$matches[1]&wc-api=$matches[3]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:32:\"author/([^/]+)/wc-api(/(.*))?/?$\";s:52:\"index.php?author_name=$matches[1]&wc-api=$matches[3]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:54:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:82:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc-api=$matches[5]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:41:\"([0-9]{4})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:66:\"index.php?year=$matches[1]&monthnum=$matches[2]&wc-api=$matches[4]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:28:\"([0-9]{4})/wc-api(/(.*))?/?$\";s:45:\"index.php?year=$matches[1]&wc-api=$matches[3]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:62:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/wc-api(/(.*))?/?$\";s:99:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&wc-api=$matches[6]\";s:62:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:73:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:25:\"(.?.+?)/wc-api(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&wc-api=$matches[3]\";s:28:\"(.?.+?)/order-pay(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&order-pay=$matches[3]\";s:33:\"(.?.+?)/order-received(/(.*))?/?$\";s:57:\"index.php?pagename=$matches[1]&order-received=$matches[3]\";s:25:\"(.?.+?)/orders(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&orders=$matches[3]\";s:29:\"(.?.+?)/view-order(/(.*))?/?$\";s:53:\"index.php?pagename=$matches[1]&view-order=$matches[3]\";s:28:\"(.?.+?)/downloads(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&downloads=$matches[3]\";s:31:\"(.?.+?)/edit-account(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-account=$matches[3]\";s:31:\"(.?.+?)/edit-address(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-address=$matches[3]\";s:34:\"(.?.+?)/payment-methods(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&payment-methods=$matches[3]\";s:32:\"(.?.+?)/lost-password(/(.*))?/?$\";s:56:\"index.php?pagename=$matches[1]&lost-password=$matches[3]\";s:34:\"(.?.+?)/customer-logout(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&customer-logout=$matches[3]\";s:37:\"(.?.+?)/add-payment-method(/(.*))?/?$\";s:61:\"index.php?pagename=$matches[1]&add-payment-method=$matches[3]\";s:40:\"(.?.+?)/delete-payment-method(/(.*))?/?$\";s:64:\"index.php?pagename=$matches[1]&delete-payment-method=$matches[3]\";s:45:\"(.?.+?)/set-default-payment-method(/(.*))?/?$\";s:69:\"index.php?pagename=$matches[1]&set-default-payment-method=$matches[3]\";s:31:\".?.+?/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\".?.+?/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}','yes'),
	(30,'hack_file','0','yes'),
	(31,'blog_charset','UTF-8','yes'),
	(32,'moderation_keys','','no'),
	(33,'active_plugins','a:2:{i:0;s:27:\"woocommerce/woocommerce.php\";i:1;s:41:\"wordpress-importer/wordpress-importer.php\";}','yes'),
	(34,'category_base','','yes'),
	(35,'ping_sites','http://rpc.pingomatic.com/','yes'),
	(36,'comment_max_links','2','yes'),
	(37,'gmt_offset','0','yes'),
	(38,'default_email_category','1','yes'),
	(39,'recently_edited','','no'),
	(40,'template','twentysixteen','yes'),
	(41,'stylesheet','twentysixteen','yes'),
	(42,'comment_whitelist','1','yes'),
	(43,'blacklist_keys','','no'),
	(44,'comment_registration','0','yes'),
	(45,'html_type','text/html','yes'),
	(46,'use_trackback','0','yes'),
	(47,'default_role','subscriber','yes'),
	(49,'uploads_use_yearmonth_folders','1','yes'),
	(50,'upload_path','','yes'),
	(51,'blog_public','1','yes'),
	(52,'default_link_category','2','yes'),
	(53,'show_on_front','posts','yes'),
	(54,'tag_base','','yes'),
	(55,'show_avatars','1','yes'),
	(56,'avatar_rating','G','yes'),
	(57,'upload_url_path','','yes'),
	(58,'thumbnail_size_w','150','yes'),
	(59,'thumbnail_size_h','150','yes'),
	(60,'thumbnail_crop','1','yes'),
	(61,'medium_size_w','300','yes'),
	(62,'medium_size_h','300','yes'),
	(63,'avatar_default','mystery','yes'),
	(64,'large_size_w','1024','yes'),
	(65,'large_size_h','1024','yes'),
	(66,'image_default_link_type','none','yes'),
	(67,'image_default_size','','yes'),
	(68,'image_default_align','','yes'),
	(69,'close_comments_for_old_posts','0','yes'),
	(70,'close_comments_days_old','14','yes'),
	(71,'thread_comments','1','yes'),
	(72,'thread_comments_depth','5','yes'),
	(73,'page_comments','0','yes'),
	(74,'comments_per_page','50','yes'),
	(75,'default_comments_page','newest','yes'),
	(76,'comment_order','asc','yes'),
	(77,'sticky_posts','a:0:{}','yes'),
	(78,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),
	(79,'widget_text','a:0:{}','yes'),
	(80,'widget_rss','a:0:{}','yes'),
	(81,'uninstall_plugins','a:0:{}','no'),
	(82,'timezone_string','','yes'),
	(83,'page_for_posts','0','yes'),
	(84,'page_on_front','0','yes'),
	(85,'default_post_format','0','yes'),
	(86,'link_manager_enabled','0','yes'),
	(87,'finished_splitting_shared_terms','1','yes'),
	(88,'site_icon','0','yes'),
	(89,'medium_large_size_w','768','yes'),
	(90,'medium_large_size_h','0','yes'),
	(91,'initial_db_version','36686','yes'),
	(92,'wp_user_roles','a:7:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:131:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;s:17:\"edit_shop_webhook\";b:1;s:17:\"read_shop_webhook\";b:1;s:19:\"delete_shop_webhook\";b:1;s:18:\"edit_shop_webhooks\";b:1;s:25:\"edit_others_shop_webhooks\";b:1;s:21:\"publish_shop_webhooks\";b:1;s:26:\"read_private_shop_webhooks\";b:1;s:20:\"delete_shop_webhooks\";b:1;s:28:\"delete_private_shop_webhooks\";b:1;s:30:\"delete_published_shop_webhooks\";b:1;s:27:\"delete_others_shop_webhooks\";b:1;s:26:\"edit_private_shop_webhooks\";b:1;s:28:\"edit_published_shop_webhooks\";b:1;s:25:\"manage_shop_webhook_terms\";b:1;s:23:\"edit_shop_webhook_terms\";b:1;s:25:\"delete_shop_webhook_terms\";b:1;s:25:\"assign_shop_webhook_terms\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:8:\"customer\";a:2:{s:4:\"name\";s:8:\"Customer\";s:12:\"capabilities\";a:1:{s:4:\"read\";b:1;}}s:12:\"shop_manager\";a:2:{s:4:\"name\";s:12:\"Shop Manager\";s:12:\"capabilities\";a:110:{s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:4:\"read\";b:1;s:18:\"read_private_pages\";b:1;s:18:\"read_private_posts\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_posts\";b:1;s:10:\"edit_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:20:\"edit_published_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:17:\"edit_others_pages\";b:1;s:13:\"publish_posts\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_posts\";b:1;s:12:\"delete_pages\";b:1;s:20:\"delete_private_pages\";b:1;s:20:\"delete_private_posts\";b:1;s:22:\"delete_published_pages\";b:1;s:22:\"delete_published_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:19:\"delete_others_pages\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:17:\"moderate_comments\";b:1;s:15:\"unfiltered_html\";b:1;s:12:\"upload_files\";b:1;s:6:\"export\";b:1;s:6:\"import\";b:1;s:10:\"list_users\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;s:17:\"edit_shop_webhook\";b:1;s:17:\"read_shop_webhook\";b:1;s:19:\"delete_shop_webhook\";b:1;s:18:\"edit_shop_webhooks\";b:1;s:25:\"edit_others_shop_webhooks\";b:1;s:21:\"publish_shop_webhooks\";b:1;s:26:\"read_private_shop_webhooks\";b:1;s:20:\"delete_shop_webhooks\";b:1;s:28:\"delete_private_shop_webhooks\";b:1;s:30:\"delete_published_shop_webhooks\";b:1;s:27:\"delete_others_shop_webhooks\";b:1;s:26:\"edit_private_shop_webhooks\";b:1;s:28:\"edit_published_shop_webhooks\";b:1;s:25:\"manage_shop_webhook_terms\";b:1;s:23:\"edit_shop_webhook_terms\";b:1;s:25:\"delete_shop_webhook_terms\";b:1;s:25:\"assign_shop_webhook_terms\";b:1;}}}','yes'),
	(140,'woocommerce_default_country','GB','yes'),
	(141,'woocommerce_allowed_countries','all','yes'),
	(142,'woocommerce_all_except_countries','a:0:{}','yes'),
	(143,'woocommerce_specific_allowed_countries','a:0:{}','yes'),
	(144,'woocommerce_ship_to_countries','','yes'),
	(145,'woocommerce_specific_ship_to_countries','a:0:{}','yes'),
	(146,'woocommerce_default_customer_address','geolocation','yes'),
	(147,'woocommerce_calc_taxes','yes','yes'),
	(148,'woocommerce_demo_store','no','yes'),
	(149,'woocommerce_demo_store_notice','This is a demo store for testing purposes &mdash; no orders shall be fulfilled.','no'),
	(150,'woocommerce_currency','GBP','yes'),
	(151,'woocommerce_currency_pos','left','yes'),
	(152,'woocommerce_price_thousand_sep',',','yes'),
	(153,'woocommerce_price_decimal_sep','.','yes'),
	(154,'woocommerce_price_num_decimals','2','yes'),
	(155,'woocommerce_weight_unit','kg','yes'),
	(156,'woocommerce_dimension_unit','cm','yes'),
	(157,'woocommerce_enable_review_rating','yes','yes'),
	(158,'woocommerce_review_rating_required','yes','no'),
	(159,'woocommerce_review_rating_verification_label','yes','no'),
	(160,'woocommerce_review_rating_verification_required','no','no'),
	(161,'woocommerce_shop_page_id','','yes'),
	(162,'woocommerce_shop_page_display','','yes'),
	(163,'woocommerce_category_archive_display','','yes'),
	(164,'woocommerce_default_catalog_orderby','menu_order','yes'),
	(165,'woocommerce_cart_redirect_after_add','no','yes'),
	(166,'woocommerce_enable_ajax_add_to_cart','yes','yes'),
	(167,'shop_catalog_image_size','a:3:{s:5:\"width\";s:3:\"300\";s:6:\"height\";s:3:\"300\";s:4:\"crop\";i:1;}','yes'),
	(168,'shop_single_image_size','a:3:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"600\";s:4:\"crop\";i:1;}','yes'),
	(169,'shop_thumbnail_image_size','a:3:{s:5:\"width\";s:3:\"180\";s:6:\"height\";s:3:\"180\";s:4:\"crop\";i:1;}','yes'),
	(170,'woocommerce_enable_lightbox','yes','yes'),
	(171,'woocommerce_manage_stock','yes','yes'),
	(172,'woocommerce_hold_stock_minutes','60','no'),
	(173,'woocommerce_notify_low_stock','yes','no'),
	(174,'woocommerce_notify_no_stock','yes','no'),
	(175,'woocommerce_stock_email_recipient','support@wcpos.com','no'),
	(176,'woocommerce_notify_low_stock_amount','2','no'),
	(177,'woocommerce_notify_no_stock_amount','0','yes'),
	(178,'woocommerce_hide_out_of_stock_items','no','yes'),
	(179,'woocommerce_stock_format','','yes'),
	(180,'woocommerce_file_download_method','force','no'),
	(181,'woocommerce_downloads_require_login','no','no'),
	(182,'woocommerce_downloads_grant_access_after_payment','yes','no'),
	(183,'woocommerce_prices_include_tax','no','yes'),
	(184,'woocommerce_tax_based_on','shipping','yes'),
	(185,'woocommerce_shipping_tax_class','','yes'),
	(186,'woocommerce_tax_round_at_subtotal','no','yes'),
	(187,'woocommerce_tax_classes','Reduced Rate\nZero Rate','yes'),
	(188,'woocommerce_tax_display_shop','excl','yes'),
	(189,'woocommerce_tax_display_cart','excl','no'),
	(190,'woocommerce_price_display_suffix','','yes'),
	(191,'woocommerce_tax_total_display','itemized','no'),
	(192,'woocommerce_enable_shipping_calc','yes','no'),
	(193,'woocommerce_shipping_cost_requires_address','no','no'),
	(194,'woocommerce_ship_to_destination','billing','no'),
	(195,'woocommerce_enable_coupons','yes','yes'),
	(196,'woocommerce_calc_discounts_sequentially','no','no'),
	(197,'woocommerce_enable_guest_checkout','yes','no'),
	(198,'woocommerce_force_ssl_checkout','no','yes'),
	(199,'woocommerce_unforce_ssl_checkout','no','yes'),
	(200,'woocommerce_cart_page_id','','yes'),
	(201,'woocommerce_checkout_page_id','','yes'),
	(202,'woocommerce_terms_page_id','','no'),
	(203,'woocommerce_checkout_pay_endpoint','order-pay','yes'),
	(204,'woocommerce_checkout_order_received_endpoint','order-received','yes'),
	(205,'woocommerce_myaccount_add_payment_method_endpoint','add-payment-method','yes'),
	(206,'woocommerce_myaccount_delete_payment_method_endpoint','delete-payment-method','yes'),
	(207,'woocommerce_myaccount_set_default_payment_method_endpoint','set-default-payment-method','yes'),
	(208,'woocommerce_myaccount_page_id','','yes'),
	(209,'woocommerce_enable_signup_and_login_from_checkout','yes','no'),
	(210,'woocommerce_enable_myaccount_registration','no','no'),
	(211,'woocommerce_enable_checkout_login_reminder','yes','no'),
	(212,'woocommerce_registration_generate_username','yes','no'),
	(213,'woocommerce_registration_generate_password','no','no'),
	(214,'woocommerce_myaccount_orders_endpoint','orders','yes'),
	(215,'woocommerce_myaccount_view_order_endpoint','view-order','yes'),
	(216,'woocommerce_myaccount_downloads_endpoint','downloads','yes'),
	(217,'woocommerce_myaccount_edit_account_endpoint','edit-account','yes'),
	(218,'woocommerce_myaccount_edit_address_endpoint','edit-address','yes'),
	(219,'woocommerce_myaccount_payment_methods_endpoint','payment-methods','yes'),
	(220,'woocommerce_myaccount_lost_password_endpoint','lost-password','yes'),
	(221,'woocommerce_logout_endpoint','customer-logout','yes'),
	(222,'woocommerce_email_from_name','WooCommerce POS Dev','no'),
	(223,'woocommerce_email_from_address','support@wcpos.com','no'),
	(224,'woocommerce_email_header_image','','no'),
	(225,'woocommerce_email_footer_text','WooCommerce POS Dev - Powered by WooCommerce','no'),
	(226,'woocommerce_email_base_color','#557da1','no'),
	(227,'woocommerce_email_background_color','#f5f5f5','no'),
	(228,'woocommerce_email_body_background_color','#fdfdfd','no'),
	(229,'woocommerce_email_text_color','#505050','no'),
	(230,'woocommerce_api_enabled','yes','yes'),
	(236,'woocommerce_admin_notices','a:0:{}','yes'),
	(253,'woocommerce_meta_box_errors','a:0:{}','yes'),
	(267,'category_children','a:0:{}','yes'),
	(268,'product_cat_children','a:2:{i:9;a:2:{i:0;i:10;i:1;i:14;}i:11;a:2:{i:0;i:13;i:1;i:15;}}','yes'),
	(269,'pa_color_children','a:0:{}','yes');

/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_postmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_postmeta`;

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`)
VALUES
	(1,2,'_wp_page_template','default'),
	(4,15,'_thumbnail_id','16'),
	(5,15,'_visibility','visible'),
	(6,15,'_stock_status','instock'),
	(7,15,'total_sales','0'),
	(8,15,'_downloadable','no'),
	(9,15,'_virtual','no'),
	(10,15,'_product_image_gallery','17'),
	(11,15,'_regular_price','20'),
	(12,15,'_sale_price','18'),
	(13,15,'_tax_status',''),
	(14,15,'_tax_class',''),
	(15,15,'_purchase_note',''),
	(16,15,'_featured','yes'),
	(17,15,'_weight',''),
	(18,15,'_length',''),
	(19,15,'_width',''),
	(20,15,'_height',''),
	(21,15,'_sku',''),
	(22,15,'_product_attributes','a:0:{}'),
	(23,15,'_sale_price_dates_from',''),
	(24,15,'_sale_price_dates_to',''),
	(25,15,'_price','18'),
	(26,15,'_sold_individually',''),
	(27,15,'_stock','5'),
	(28,15,'_backorders','no'),
	(29,15,'_manage_stock','yes'),
	(30,15,'_upsell_ids','a:1:{i:0;s:2:\"60\";}'),
	(31,19,'_thumbnail_id','20'),
	(32,19,'_visibility','visible'),
	(33,19,'_stock_status','instock'),
	(34,19,'total_sales','0'),
	(35,19,'_downloadable','no'),
	(36,19,'_virtual','no'),
	(37,19,'_product_image_gallery','21'),
	(38,19,'_regular_price','20'),
	(39,19,'_sale_price',''),
	(40,19,'_tax_status',''),
	(41,19,'_tax_class',''),
	(42,19,'_purchase_note',''),
	(43,19,'_featured','no'),
	(44,19,'_weight',''),
	(45,19,'_length',''),
	(46,19,'_width',''),
	(47,19,'_height',''),
	(48,19,'_sku',''),
	(49,19,'_product_attributes','a:0:{}'),
	(50,19,'_sale_price_dates_from',''),
	(51,19,'_sale_price_dates_to',''),
	(52,19,'_price','20'),
	(53,19,'_sold_individually',''),
	(54,19,'_stock',''),
	(55,19,'_backorders','no'),
	(56,19,'_manage_stock','no'),
	(57,22,'_visibility','visible'),
	(58,22,'_stock_status','instock'),
	(59,22,'total_sales','0'),
	(60,22,'_downloadable','no'),
	(61,22,'_virtual','no'),
	(62,22,'_product_image_gallery','26,27,28,29'),
	(63,22,'_regular_price','20'),
	(64,22,'_sale_price',''),
	(65,22,'_tax_status',''),
	(66,22,'_tax_class',''),
	(67,22,'_purchase_note',''),
	(68,22,'_featured','no'),
	(69,22,'_weight',''),
	(70,22,'_length',''),
	(71,22,'_width',''),
	(72,22,'_height',''),
	(73,22,'_sku',''),
	(74,22,'_product_attributes','a:1:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";s:1:\"0\";s:10:\"is_visible\";i:0;s:12:\"is_variation\";i:1;s:11:\"is_taxonomy\";i:1;}}'),
	(75,22,'_sale_price_dates_from',''),
	(76,22,'_sale_price_dates_to',''),
	(77,22,'_price','20'),
	(78,22,'_sold_individually',''),
	(79,22,'_stock',''),
	(80,22,'_backorders','no'),
	(81,22,'_manage_stock','no'),
	(82,22,'_thumbnail_id','25'),
	(83,22,'_min_variation_price','20'),
	(84,22,'_max_variation_price','20'),
	(85,22,'_min_variation_regular_price','20'),
	(86,22,'_max_variation_regular_price','20'),
	(87,22,'_min_variation_sale_price',''),
	(88,22,'_max_variation_sale_price',''),
	(89,22,'_default_attributes','a:0:{}'),
	(90,22,'_wp_old_slug','share-your-idea'),
	(91,22,'_upsell_ids','a:1:{i:0;s:2:\"40\";}'),
	(92,31,'_thumbnail_id','32'),
	(93,31,'_visibility','visible'),
	(94,31,'_stock_status','instock'),
	(95,31,'total_sales','0'),
	(96,31,'_downloadable','no'),
	(97,31,'_virtual','no'),
	(98,31,'_product_image_gallery','33'),
	(99,31,'_regular_price','20'),
	(100,31,'_sale_price',''),
	(101,31,'_tax_status',''),
	(102,31,'_tax_class',''),
	(103,31,'_purchase_note',''),
	(104,31,'_featured','no'),
	(105,31,'_weight',''),
	(106,31,'_length',''),
	(107,31,'_width',''),
	(108,31,'_height',''),
	(109,31,'_sku',''),
	(110,31,'_product_attributes','a:0:{}'),
	(111,31,'_sale_price_dates_from',''),
	(112,31,'_sale_price_dates_to',''),
	(113,31,'_price','20'),
	(114,31,'_sold_individually',''),
	(115,31,'_stock',''),
	(116,31,'_backorders','no'),
	(117,31,'_manage_stock','no'),
	(118,31,'_crosssell_ids','a:2:{i:0;s:2:\"34\";i:1;s:2:\"37\";}'),
	(119,31,'_upsell_ids','a:1:{i:0;s:2:\"56\";}'),
	(120,34,'_thumbnail_id','35'),
	(121,34,'_visibility','visible'),
	(122,34,'_stock_status','instock'),
	(123,34,'total_sales','0'),
	(124,34,'_downloadable','no'),
	(125,34,'_virtual','no'),
	(126,34,'_product_image_gallery','36'),
	(127,34,'_regular_price','20'),
	(128,34,'_sale_price',''),
	(129,34,'_tax_status',''),
	(130,34,'_tax_class',''),
	(131,34,'_purchase_note',''),
	(132,34,'_featured','no'),
	(133,34,'_weight',''),
	(134,34,'_length',''),
	(135,34,'_width',''),
	(136,34,'_height',''),
	(137,34,'_sku',''),
	(138,34,'_product_attributes','a:0:{}'),
	(139,34,'_sale_price_dates_from',''),
	(140,34,'_sale_price_dates_to',''),
	(141,34,'_price','20'),
	(142,34,'_sold_individually',''),
	(143,34,'_stock',''),
	(144,34,'_backorders','no'),
	(145,34,'_manage_stock','no'),
	(146,34,'_crosssell_ids','a:2:{i:0;s:2:\"37\";i:1;s:2:\"31\";}'),
	(147,34,'_upsell_ids','a:1:{i:0;s:2:\"47\";}'),
	(148,37,'_visibility','visible'),
	(149,37,'_stock_status','instock'),
	(150,37,'total_sales','0'),
	(151,37,'_downloadable','no'),
	(152,37,'_virtual','no'),
	(153,37,'_product_image_gallery','39'),
	(154,37,'_regular_price','18'),
	(155,37,'_sale_price',''),
	(156,37,'_tax_status',''),
	(157,37,'_tax_class',''),
	(158,37,'_purchase_note',''),
	(159,37,'_featured','no'),
	(160,37,'_weight',''),
	(161,37,'_length',''),
	(162,37,'_width',''),
	(163,37,'_height',''),
	(164,37,'_sku',''),
	(165,37,'_product_attributes','a:0:{}'),
	(166,37,'_sale_price_dates_from',''),
	(167,37,'_sale_price_dates_to',''),
	(168,37,'_price','18'),
	(169,37,'_sold_individually',''),
	(170,37,'_stock',''),
	(171,37,'_backorders','no'),
	(172,37,'_manage_stock','no'),
	(173,37,'_thumbnail_id','38'),
	(174,37,'_crosssell_ids','a:2:{i:0;s:2:\"34\";i:1;s:2:\"31\";}'),
	(175,37,'_upsell_ids','a:1:{i:0;s:2:\"53\";}'),
	(176,40,'_visibility','visible'),
	(177,40,'_stock_status','instock'),
	(178,40,'total_sales','0'),
	(179,40,'_downloadable','no'),
	(180,40,'_virtual','no'),
	(181,40,'_product_image_gallery','44,45,46'),
	(182,40,'_regular_price','30'),
	(183,40,'_sale_price',''),
	(184,40,'_tax_status',''),
	(185,40,'_tax_class',''),
	(186,40,'_purchase_note',''),
	(187,40,'_featured','no'),
	(188,40,'_weight',''),
	(189,40,'_length',''),
	(190,40,'_width',''),
	(191,40,'_height',''),
	(192,40,'_sku',''),
	(193,40,'_product_attributes','a:1:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";s:1:\"0\";s:10:\"is_visible\";i:0;s:12:\"is_variation\";i:1;s:11:\"is_taxonomy\";i:1;}}'),
	(194,40,'_sale_price_dates_from',''),
	(195,40,'_sale_price_dates_to',''),
	(196,40,'_price','30'),
	(197,40,'_sold_individually',''),
	(198,40,'_stock',''),
	(199,40,'_backorders','no'),
	(200,40,'_manage_stock','no'),
	(201,40,'_min_variation_price','30'),
	(202,40,'_max_variation_price','35'),
	(203,40,'_min_variation_regular_price','35'),
	(204,40,'_max_variation_regular_price','35'),
	(205,40,'_min_variation_sale_price','30'),
	(206,40,'_max_variation_sale_price','30'),
	(207,40,'_default_attributes','a:1:{s:8:\"pa_color\";s:5:\"black\";}'),
	(208,40,'_thumbnail_id','43'),
	(209,40,'_crosssell_ids','a:1:{i:0;s:2:\"22\";}'),
	(210,47,'_visibility','visible'),
	(211,47,'_stock_status','instock'),
	(212,47,'total_sales','0'),
	(213,47,'_downloadable','no'),
	(214,47,'_virtual','no'),
	(215,47,'_product_image_gallery','49'),
	(216,47,'_regular_price','35'),
	(217,47,'_sale_price',''),
	(218,47,'_tax_status',''),
	(219,47,'_tax_class',''),
	(220,47,'_purchase_note',''),
	(221,47,'_featured','no'),
	(222,47,'_weight',''),
	(223,47,'_length',''),
	(224,47,'_width',''),
	(225,47,'_height',''),
	(226,47,'_sku',''),
	(227,47,'_product_attributes','a:0:{}'),
	(228,47,'_sale_price_dates_from',''),
	(229,47,'_sale_price_dates_to',''),
	(230,47,'_price','35'),
	(231,47,'_sold_individually',''),
	(232,47,'_stock',''),
	(233,47,'_backorders','no'),
	(234,47,'_manage_stock','no'),
	(235,47,'_thumbnail_id','48'),
	(236,47,'_crosssell_ids','a:1:{i:0;s:2:\"34\";}'),
	(237,50,'_visibility','visible'),
	(238,50,'_stock_status','instock'),
	(239,50,'total_sales','0'),
	(240,50,'_downloadable','no'),
	(241,50,'_virtual','no'),
	(242,50,'_product_image_gallery','52'),
	(243,50,'_regular_price','35'),
	(244,50,'_sale_price',''),
	(245,50,'_tax_status',''),
	(246,50,'_tax_class',''),
	(247,50,'_purchase_note',''),
	(248,50,'_featured','yes'),
	(249,50,'_weight',''),
	(250,50,'_length',''),
	(251,50,'_width',''),
	(252,50,'_height',''),
	(253,50,'_sku',''),
	(254,50,'_product_attributes','a:0:{}'),
	(255,50,'_sale_price_dates_from',''),
	(256,50,'_sale_price_dates_to',''),
	(257,50,'_price','35'),
	(258,50,'_sold_individually',''),
	(259,50,'_stock',''),
	(260,50,'_backorders','no'),
	(261,50,'_manage_stock','no'),
	(262,50,'_thumbnail_id','51'),
	(263,50,'_crosssell_ids','a:1:{i:0;s:2:\"53\";}'),
	(264,53,'_thumbnail_id','54'),
	(265,53,'_visibility','visible'),
	(266,53,'_stock_status','instock'),
	(267,53,'total_sales','0'),
	(268,53,'_downloadable','no'),
	(269,53,'_virtual','no'),
	(270,53,'_product_image_gallery','55'),
	(271,53,'_regular_price','35'),
	(272,53,'_sale_price',''),
	(273,53,'_tax_status',''),
	(274,53,'_tax_class',''),
	(275,53,'_purchase_note',''),
	(276,53,'_featured','no'),
	(277,53,'_weight',''),
	(278,53,'_length',''),
	(279,53,'_width',''),
	(280,53,'_height',''),
	(281,53,'_sku',''),
	(282,53,'_product_attributes','a:0:{}'),
	(283,53,'_sale_price_dates_from',''),
	(284,53,'_sale_price_dates_to',''),
	(285,53,'_price','35'),
	(286,53,'_sold_individually',''),
	(287,53,'_stock',''),
	(288,53,'_backorders','no'),
	(289,53,'_manage_stock','no'),
	(290,53,'_crosssell_ids','a:1:{i:0;s:2:\"37\";}'),
	(291,56,'_visibility','visible'),
	(292,56,'_stock_status','instock'),
	(293,56,'total_sales','0'),
	(294,56,'_downloadable','no'),
	(295,56,'_virtual','no'),
	(296,56,'_product_image_gallery','58'),
	(297,56,'_regular_price','35'),
	(298,56,'_sale_price',''),
	(299,56,'_tax_status',''),
	(300,56,'_tax_class',''),
	(301,56,'_purchase_note',''),
	(302,56,'_featured','yes'),
	(303,56,'_weight',''),
	(304,56,'_length',''),
	(305,56,'_width',''),
	(306,56,'_height',''),
	(307,56,'_sku',''),
	(308,56,'_product_attributes','a:0:{}'),
	(309,56,'_sale_price_dates_from',''),
	(310,56,'_sale_price_dates_to',''),
	(311,56,'_price','35'),
	(312,56,'_sold_individually',''),
	(313,56,'_stock',''),
	(314,56,'_backorders','no'),
	(315,56,'_manage_stock','no'),
	(316,56,'_thumbnail_id','57'),
	(317,56,'_crosssell_ids','a:1:{i:0;s:2:\"31\";}'),
	(318,60,'_thumbnail_id','61'),
	(319,60,'_visibility','visible'),
	(320,60,'_stock_status','instock'),
	(321,60,'total_sales','0'),
	(322,60,'_downloadable','no'),
	(323,60,'_virtual','no'),
	(324,60,'_product_image_gallery','62'),
	(325,60,'_regular_price','35'),
	(326,60,'_sale_price',''),
	(327,60,'_tax_status',''),
	(328,60,'_tax_class',''),
	(329,60,'_purchase_note',''),
	(330,60,'_featured','no'),
	(331,60,'_weight',''),
	(332,60,'_length',''),
	(333,60,'_width',''),
	(334,60,'_height',''),
	(335,60,'_sku',''),
	(336,60,'_product_attributes','a:0:{}'),
	(337,60,'_sale_price_dates_from',''),
	(338,60,'_sale_price_dates_to',''),
	(339,60,'_price','35'),
	(340,60,'_sold_individually',''),
	(341,60,'_stock',''),
	(342,60,'_backorders','no'),
	(343,60,'_manage_stock','no'),
	(344,60,'_crosssell_ids','a:1:{i:0;s:2:\"15\";}'),
	(345,67,'_visibility','visible'),
	(346,67,'_stock_status','instock'),
	(347,67,'total_sales','0'),
	(348,67,'_downloadable','no'),
	(349,67,'_virtual','no'),
	(350,67,'_product_image_gallery','69'),
	(351,67,'_regular_price','15'),
	(352,67,'_sale_price',''),
	(353,67,'_tax_status',''),
	(354,67,'_tax_class',''),
	(355,67,'_purchase_note',''),
	(356,67,'_featured','no'),
	(357,67,'_weight',''),
	(358,67,'_length',''),
	(359,67,'_width',''),
	(360,67,'_height',''),
	(361,67,'_sku',''),
	(362,67,'_product_attributes','a:0:{}'),
	(363,67,'_sale_price_dates_from',''),
	(364,67,'_sale_price_dates_to',''),
	(365,67,'_price','15'),
	(366,67,'_sold_individually',''),
	(367,67,'_stock',''),
	(368,67,'_backorders','no'),
	(369,67,'_manage_stock','no'),
	(370,67,'_thumbnail_id','68'),
	(371,67,'_upsell_ids','a:2:{i:0;s:2:\"22\";i:1;s:2:\"40\";}'),
	(372,67,'_crosssell_ids','a:2:{i:0;s:2:\"22\";i:1;s:2:\"40\";}'),
	(373,70,'_visibility','visible'),
	(374,70,'_stock_status','instock'),
	(375,70,'total_sales','0'),
	(376,70,'_downloadable','no'),
	(377,70,'_virtual','no'),
	(378,70,'_product_image_gallery','72'),
	(379,70,'_regular_price','15'),
	(380,70,'_sale_price','12'),
	(381,70,'_tax_status',''),
	(382,70,'_tax_class',''),
	(383,70,'_purchase_note',''),
	(384,70,'_featured','no'),
	(385,70,'_weight',''),
	(386,70,'_length',''),
	(387,70,'_width',''),
	(388,70,'_height',''),
	(389,70,'_sku',''),
	(390,70,'_product_attributes','a:0:{}'),
	(391,70,'_sale_price_dates_from',''),
	(392,70,'_sale_price_dates_to',''),
	(393,70,'_price','12'),
	(394,70,'_sold_individually',''),
	(395,70,'_stock',''),
	(396,70,'_backorders','no'),
	(397,70,'_manage_stock','no'),
	(398,70,'_thumbnail_id','71'),
	(399,73,'_visibility','visible'),
	(400,73,'_stock_status','instock'),
	(401,73,'total_sales','0'),
	(402,73,'_downloadable','no'),
	(403,73,'_virtual','no'),
	(404,73,'_product_image_gallery','75'),
	(405,73,'_regular_price','15'),
	(406,73,'_sale_price','12'),
	(407,73,'_tax_status',''),
	(408,73,'_tax_class',''),
	(409,73,'_purchase_note',''),
	(410,73,'_featured','no'),
	(411,73,'_weight',''),
	(412,73,'_length',''),
	(413,73,'_width',''),
	(414,73,'_height',''),
	(415,73,'_sku',''),
	(416,73,'_product_attributes','a:0:{}'),
	(417,73,'_sale_price_dates_from',''),
	(418,73,'_sale_price_dates_to',''),
	(419,73,'_price','12'),
	(420,73,'_sold_individually',''),
	(421,73,'_stock',''),
	(422,73,'_backorders','no'),
	(423,73,'_manage_stock','no'),
	(424,73,'_upsell_ids','a:1:{i:0;s:2:\"19\";}'),
	(425,73,'_thumbnail_id','74'),
	(426,76,'_thumbnail_id','77'),
	(427,76,'_visibility','visible'),
	(428,76,'_stock_status','instock'),
	(429,76,'total_sales','0'),
	(430,76,'_downloadable','no'),
	(431,76,'_virtual','no'),
	(432,76,'_product_image_gallery','78'),
	(433,76,'_regular_price','15'),
	(434,76,'_sale_price',''),
	(435,76,'_tax_status',''),
	(436,76,'_tax_class',''),
	(437,76,'_purchase_note',''),
	(438,76,'_featured','no'),
	(439,76,'_weight',''),
	(440,76,'_length',''),
	(441,76,'_width',''),
	(442,76,'_height',''),
	(443,76,'_sku',''),
	(444,76,'_product_attributes','a:0:{}'),
	(445,76,'_sale_price_dates_from',''),
	(446,76,'_sale_price_dates_to',''),
	(447,76,'_price','15'),
	(448,76,'_sold_individually',''),
	(449,76,'_stock',''),
	(450,76,'_backorders','no'),
	(451,76,'_manage_stock','no'),
	(452,76,'_crosssell_ids','a:2:{i:0;s:2:\"34\";i:1;s:2:\"47\";}'),
	(453,23,'_sku',''),
	(454,23,'_weight',''),
	(455,23,'_length',''),
	(456,23,'_width',''),
	(457,23,'_height',''),
	(458,23,'_stock',''),
	(459,23,'_thumbnail_id','29'),
	(460,23,'_virtual','no'),
	(461,23,'_downloadable','no'),
	(462,23,'_regular_price','20'),
	(463,23,'_sale_price',''),
	(464,23,'_sale_price_dates_from',''),
	(465,23,'_sale_price_dates_to',''),
	(466,23,'_price','20'),
	(467,23,'_tax_class',''),
	(468,23,'_download_limit',''),
	(469,23,'_download_expiry',''),
	(470,23,'_file_paths',''),
	(471,23,'attribute_pa_color','black'),
	(472,24,'_sku',''),
	(473,24,'_weight',''),
	(474,24,'_length',''),
	(475,24,'_width',''),
	(476,24,'_height',''),
	(477,24,'_stock',''),
	(478,24,'_thumbnail_id','27'),
	(479,24,'_virtual','no'),
	(480,24,'_downloadable','no'),
	(481,24,'_regular_price','20'),
	(482,24,'_sale_price',''),
	(483,24,'_sale_price_dates_from',''),
	(484,24,'_sale_price_dates_to',''),
	(485,24,'_price','20'),
	(486,24,'_tax_class',''),
	(487,24,'_download_limit',''),
	(488,24,'_download_expiry',''),
	(489,24,'_file_paths',''),
	(490,24,'attribute_pa_color','green'),
	(491,41,'_sku',''),
	(492,41,'_weight',''),
	(493,41,'_length',''),
	(494,41,'_width',''),
	(495,41,'_height',''),
	(496,41,'_stock',''),
	(497,41,'_thumbnail_id','43'),
	(498,41,'_virtual','no'),
	(499,41,'_downloadable','no'),
	(500,41,'_regular_price','35'),
	(501,41,'_sale_price',''),
	(502,41,'_sale_price_dates_from',''),
	(503,41,'_sale_price_dates_to',''),
	(504,41,'_price','35'),
	(505,41,'_tax_class',''),
	(506,41,'_download_limit',''),
	(507,41,'_download_expiry',''),
	(508,41,'_file_paths',''),
	(509,41,'attribute_pa_color','black'),
	(510,42,'_sku',''),
	(511,42,'_weight',''),
	(512,42,'_length',''),
	(513,42,'_width',''),
	(514,42,'_height',''),
	(515,42,'_stock',''),
	(516,42,'_thumbnail_id','46'),
	(517,42,'_virtual','no'),
	(518,42,'_downloadable','no'),
	(519,42,'_regular_price','35'),
	(520,42,'_sale_price','30'),
	(521,42,'_sale_price_dates_from',''),
	(522,42,'_sale_price_dates_to',''),
	(523,42,'_price','30'),
	(524,42,'_tax_class',''),
	(525,42,'_download_limit',''),
	(526,42,'_download_expiry',''),
	(527,42,'_file_paths',''),
	(528,42,'attribute_pa_color','blue'),
	(529,79,'_thumbnail_id','80'),
	(530,79,'_visibility','visible'),
	(531,79,'_stock_status','instock'),
	(532,79,'total_sales','0'),
	(533,79,'_downloadable','no'),
	(534,79,'_virtual','no'),
	(535,79,'_product_image_gallery','81'),
	(536,79,'_regular_price','15'),
	(537,79,'_sale_price',''),
	(538,79,'_tax_status',''),
	(539,79,'_tax_class',''),
	(540,79,'_purchase_note',''),
	(541,79,'_featured','no'),
	(542,79,'_weight',''),
	(543,79,'_length',''),
	(544,79,'_width',''),
	(545,79,'_height',''),
	(546,79,'_sku',''),
	(547,79,'_product_attributes','a:0:{}'),
	(548,79,'_sale_price_dates_from',''),
	(549,79,'_sale_price_dates_to',''),
	(550,79,'_price','15'),
	(551,79,'_sold_individually',''),
	(552,79,'_stock',''),
	(553,79,'_backorders','no'),
	(554,79,'_manage_stock','no'),
	(555,79,'_crosssell_ids','a:2:{i:0;s:2:\"15\";i:1;s:2:\"60\";}'),
	(556,83,'_thumbnail_id','84'),
	(557,83,'_visibility','visible'),
	(558,83,'_stock_status','instock'),
	(559,83,'total_sales','0'),
	(560,83,'_downloadable','yes'),
	(561,83,'_virtual','no'),
	(562,83,'_product_image_gallery','85'),
	(563,83,'_regular_price','9'),
	(564,83,'_sale_price',''),
	(565,83,'_tax_status',''),
	(566,83,'_tax_class',''),
	(567,83,'_purchase_note',''),
	(568,83,'_featured','no'),
	(569,83,'_weight',''),
	(570,83,'_length',''),
	(571,83,'_width',''),
	(572,83,'_height',''),
	(573,83,'_sku',''),
	(574,83,'_product_attributes','a:0:{}'),
	(575,83,'_sale_price_dates_from',''),
	(576,83,'_sale_price_dates_to',''),
	(577,83,'_price','9'),
	(578,83,'_sold_individually',''),
	(579,83,'_stock',''),
	(580,83,'_backorders','no'),
	(581,83,'_manage_stock','no'),
	(582,83,'_file_paths','a:0:{}'),
	(583,83,'_download_limit',''),
	(584,83,'_download_expiry',''),
	(585,87,'_thumbnail_id','88'),
	(586,87,'_visibility','visible'),
	(587,87,'_stock_status','instock'),
	(588,87,'total_sales','0'),
	(589,87,'_downloadable','yes'),
	(590,87,'_virtual','no'),
	(591,87,'_product_image_gallery','89'),
	(592,87,'_regular_price','9'),
	(593,87,'_sale_price',''),
	(594,87,'_tax_status',''),
	(595,87,'_tax_class',''),
	(596,87,'_purchase_note',''),
	(597,87,'_featured','yes'),
	(598,87,'_weight',''),
	(599,87,'_length',''),
	(600,87,'_width',''),
	(601,87,'_height',''),
	(602,87,'_sku',''),
	(603,87,'_product_attributes','a:0:{}'),
	(604,87,'_sale_price_dates_from',''),
	(605,87,'_sale_price_dates_to',''),
	(606,87,'_price','9'),
	(607,87,'_sold_individually',''),
	(608,87,'_stock',''),
	(609,87,'_backorders','no'),
	(610,87,'_manage_stock','no'),
	(611,87,'_file_paths','a:0:{}'),
	(612,87,'_download_limit',''),
	(613,87,'_download_expiry',''),
	(614,90,'_thumbnail_id','91'),
	(615,90,'_visibility','visible'),
	(616,90,'_stock_status','instock'),
	(617,90,'total_sales','0'),
	(618,90,'_downloadable','yes'),
	(619,90,'_virtual','no'),
	(620,90,'_product_image_gallery','92'),
	(621,90,'_regular_price','9'),
	(622,90,'_sale_price',''),
	(623,90,'_tax_status',''),
	(624,90,'_tax_class',''),
	(625,90,'_purchase_note',''),
	(626,90,'_featured','no'),
	(627,90,'_weight',''),
	(628,90,'_length',''),
	(629,90,'_width',''),
	(630,90,'_height',''),
	(631,90,'_sku',''),
	(632,90,'_product_attributes','a:0:{}'),
	(633,90,'_sale_price_dates_from',''),
	(634,90,'_sale_price_dates_to',''),
	(635,90,'_price','9'),
	(636,90,'_sold_individually',''),
	(637,90,'_stock',''),
	(638,90,'_backorders','no'),
	(639,90,'_manage_stock','no'),
	(640,90,'_file_paths','a:0:{}'),
	(641,90,'_download_limit',''),
	(642,90,'_download_expiry',''),
	(643,93,'_thumbnail_id','95'),
	(644,93,'_visibility','visible'),
	(645,93,'_stock_status','instock'),
	(646,93,'total_sales','0'),
	(647,93,'_downloadable','yes'),
	(648,93,'_virtual','no'),
	(649,93,'_product_image_gallery','94'),
	(650,93,'_regular_price','3'),
	(651,93,'_sale_price',''),
	(652,93,'_tax_status',''),
	(653,93,'_tax_class',''),
	(654,93,'_purchase_note',''),
	(655,93,'_featured','no'),
	(656,93,'_weight',''),
	(657,93,'_length',''),
	(658,93,'_width',''),
	(659,93,'_height',''),
	(660,93,'_sku',''),
	(661,93,'_product_attributes','a:0:{}'),
	(662,93,'_sale_price_dates_from',''),
	(663,93,'_sale_price_dates_to',''),
	(664,93,'_price','3'),
	(665,93,'_sold_individually',''),
	(666,93,'_stock',''),
	(667,93,'_backorders','no'),
	(668,93,'_manage_stock','no'),
	(669,93,'_file_paths','a:0:{}'),
	(670,93,'_download_limit',''),
	(671,93,'_download_expiry',''),
	(672,96,'_thumbnail_id','97'),
	(673,96,'_visibility','visible'),
	(674,96,'_stock_status','instock'),
	(675,96,'total_sales','0'),
	(676,96,'_downloadable','yes'),
	(677,96,'_virtual','no'),
	(678,96,'_product_image_gallery','98'),
	(679,96,'_regular_price','9'),
	(680,96,'_sale_price',''),
	(681,96,'_tax_status',''),
	(682,96,'_tax_class',''),
	(683,96,'_purchase_note',''),
	(684,96,'_featured','no'),
	(685,96,'_weight',''),
	(686,96,'_length',''),
	(687,96,'_width',''),
	(688,96,'_height',''),
	(689,96,'_sku',''),
	(690,96,'_product_attributes','a:0:{}'),
	(691,96,'_sale_price_dates_from',''),
	(692,96,'_sale_price_dates_to',''),
	(693,96,'_price','9'),
	(694,96,'_sold_individually',''),
	(695,96,'_stock',''),
	(696,96,'_backorders','no'),
	(697,96,'_manage_stock','no'),
	(698,96,'_file_paths','a:0:{}'),
	(699,96,'_download_limit',''),
	(700,96,'_download_expiry',''),
	(701,99,'_thumbnail_id','100'),
	(702,99,'_visibility','visible'),
	(703,99,'_stock_status','instock'),
	(704,99,'total_sales','0'),
	(705,99,'_downloadable','no'),
	(706,99,'_virtual','no'),
	(707,99,'_product_image_gallery','101'),
	(708,99,'_regular_price','3'),
	(709,99,'_sale_price','2'),
	(710,99,'_tax_status',''),
	(711,99,'_tax_class',''),
	(712,99,'_purchase_note',''),
	(713,99,'_featured','no'),
	(714,99,'_weight',''),
	(715,99,'_length',''),
	(716,99,'_width',''),
	(717,99,'_height',''),
	(718,99,'_sku',''),
	(719,99,'_product_attributes','a:0:{}'),
	(720,99,'_sale_price_dates_from',''),
	(721,99,'_sale_price_dates_to',''),
	(722,99,'_price','2'),
	(723,99,'_sold_individually',''),
	(724,99,'_stock',''),
	(725,99,'_backorders','no'),
	(726,99,'_manage_stock','no');

/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_posts`;

CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`)
VALUES
	(1,1,'2016-07-04 03:46:55','2016-07-04 03:46:55','Welcome to WordPress. This is your first post. Edit or delete it, then start writing!','Hello world!','','publish','open','open','','hello-world','','','2016-07-04 03:46:55','2016-07-04 03:46:55','',0,'http://localhost/?p=1',0,'post','',1),
	(2,1,'2016-07-04 03:46:55','2016-07-04 03:46:55','This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://localhost/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!','Sample Page','','publish','closed','open','','sample-page','','','2016-07-04 03:46:55','2016-07-04 03:46:55','',0,'http://localhost/?page_id=2',0,'page','',0),
	(3,1,'2016-07-04 03:47:14','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2016-07-04 03:47:14','0000-00-00 00:00:00','',0,'http://localhost/?p=3',0,'post','',0),
	(15,2,'2013-06-07 10:35:51','2013-06-07 10:35:51','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','Woo Logo','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','publish','open','closed','','woo-logo','','','2013-06-07 10:35:51','2013-06-07 10:35:51','',0,'http://demo.woothemes.com/woocommerce/?post_type=product&amp;p=15',0,'product','',1),
	(19,2,'2013-06-07 10:41:52','2013-06-07 10:41:52','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','Premium Quality','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','publish','open','closed','','premium-quality','','','2013-06-07 10:41:52','2013-06-07 10:41:52','',0,'http://demo.woothemes.com/woocommerce/?post_type=product&amp;p=19',0,'product','',2),
	(22,2,'2013-06-07 10:46:01','2013-06-07 10:46:01','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','Ship Your Idea','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','publish','open','closed','','ship-your-idea','','','2013-06-07 10:46:01','2013-06-07 10:46:01','',0,'http://demo.woothemes.com/woocommerce/?post_type=product&amp;p=22',0,'product','',3),
	(23,2,'2013-06-07 10:44:57','2013-06-07 10:44:57','','Variation #23 of Ship Your Idea','','publish','open','open','','product-22-variation','','','2013-06-07 10:44:57','2013-06-07 10:44:57','',22,'http://demo.woothemes.com/woocommerce/?product_variation=product-22-variation',0,'product_variation','',0),
	(24,2,'2013-06-07 10:44:58','2013-06-07 10:44:58','','Variation #24 of Ship Your Idea','','publish','open','open','','product-22-variation-2','','','2013-06-07 10:44:58','2013-06-07 10:44:58','',22,'http://demo.woothemes.com/woocommerce/?product_variation=product-22-variation-2',1,'product_variation','',0),
	(31,2,'2013-06-07 10:49:51','2013-06-07 10:49:51','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','Ninja Silhouette','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','publish','open','closed','','ninja-silhouette','','','2013-06-07 10:49:51','2013-06-07 10:49:51','',0,'http://demo.woothemes.com/woocommerce/?post_type=product&amp;p=31',0,'product','',1),
	(34,2,'2013-06-07 10:52:06','2013-06-07 10:52:06','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','Woo Ninja','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','publish','open','closed','','woo-ninja','','','2013-06-07 10:52:06','2013-06-07 10:52:06','',0,'http://demo.woothemes.com/woocommerce/?post_type=product&amp;p=34',0,'product','',0),
	(37,2,'2013-06-07 10:53:15','2013-06-07 10:53:15','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','Happy Ninja','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','publish','open','closed','','happy-ninja','','','2013-06-07 10:53:15','2013-06-07 10:53:15','',0,'http://demo.woothemes.com/woocommerce/?post_type=product&amp;p=37',0,'product','',2),
	(40,2,'2013-06-07 11:00:28','2013-06-07 11:00:28','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','Ship Your Idea','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','publish','open','closed','','ship-your-idea-2','','','2013-06-07 11:00:28','2013-06-07 11:00:28','',0,'http://demo.woothemes.com/woocommerce/?post_type=product&amp;p=40',0,'product','',3),
	(41,2,'2013-06-07 10:59:15','2013-06-07 10:59:15','','Variation #41 of Ship Your Idea','','publish','open','open','','product-40-variation','','','2013-06-07 10:59:15','2013-06-07 10:59:15','',40,'http://demo.woothemes.com/woocommerce/?product_variation=product-40-variation',0,'product_variation','',0),
	(42,2,'2013-06-07 10:59:15','2013-06-07 10:59:15','','Variation #42 of Ship Your Idea','','publish','open','open','','product-40-variation-2','','','2013-06-07 10:59:15','2013-06-07 10:59:15','',40,'http://demo.woothemes.com/woocommerce/?product_variation=product-40-variation-2',1,'product_variation','',0),
	(47,2,'2013-06-07 11:02:31','2013-06-07 11:02:31','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','Woo Ninja','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','publish','open','closed','','woo-ninja-2','','','2013-06-07 11:02:31','2013-06-07 11:02:31','',0,'http://demo.woothemes.com/woocommerce/?post_type=product&amp;p=47',0,'product','',2),
	(50,2,'2013-06-07 11:03:56','2013-06-07 11:03:56','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','Patient Ninja','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','publish','open','closed','','patient-ninja','','','2013-06-07 11:03:56','2013-06-07 11:03:56','',0,'http://demo.woothemes.com/woocommerce/?post_type=product&amp;p=50',0,'product','',3),
	(53,2,'2013-06-07 11:05:37','2013-06-07 11:05:37','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','Happy Ninja','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','publish','open','closed','','happy-ninja-2','','','2013-06-07 11:05:37','2013-06-07 11:05:37','',0,'http://demo.woothemes.com/woocommerce/?post_type=product&amp;p=53',0,'product','',2),
	(56,2,'2013-06-07 11:07:19','2013-06-07 11:07:19','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','Ninja Silhouette','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','publish','open','closed','','ninja-silhouette-2','','','2013-06-07 11:07:19','2013-06-07 11:07:19','',0,'http://demo.woothemes.com/woocommerce/?post_type=product&amp;p=56',0,'product','',5),
	(60,2,'2013-06-07 11:12:55','2013-06-07 11:12:55','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','Woo Logo','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','publish','open','closed','','woo-logo-2','','','2013-06-07 11:12:55','2013-06-07 11:12:55','',0,'http://demo.woothemes.com/woocommerce/?post_type=product&amp;p=60',0,'product','',2),
	(67,2,'2013-06-07 11:22:50','2013-06-07 11:22:50','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','Ship Your Idea','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','publish','open','closed','','ship-your-idea-3','','','2013-06-07 11:22:50','2013-06-07 11:22:50','',0,'http://demo.woothemes.com/woocommerce/?post_type=product&amp;p=67',0,'product','',0),
	(70,2,'2013-06-07 11:25:01','2013-06-07 11:25:01','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','Flying Ninja','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','publish','open','closed','','flying-ninja','','','2013-06-07 11:25:01','2013-06-07 11:25:01','',0,'http://demo.woothemes.com/woocommerce/?post_type=product&amp;p=70',0,'product','',4),
	(73,2,'2013-06-07 11:27:38','2013-06-07 11:27:38','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','Premium Quality','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','publish','open','closed','','premium-quality-2','','','2013-06-07 11:27:38','2013-06-07 11:27:38','',0,'http://demo.woothemes.com/woocommerce/?post_type=product&amp;p=73',0,'product','',2),
	(76,2,'2013-06-07 11:28:45','2013-06-07 11:28:45','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','Woo Ninja','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','publish','open','closed','','woo-ninja-3','','','2013-06-07 11:28:45','2013-06-07 11:28:45','',0,'http://demo.woothemes.com/woocommerce/?post_type=product&amp;p=76',0,'product','',1),
	(79,2,'2013-06-07 11:29:44','2013-06-07 11:29:44','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','Woo Logo','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','publish','open','closed','','woo-logo-3','','','2013-06-07 11:29:44','2013-06-07 11:29:44','',0,'http://demo.woothemes.com/woocommerce/?post_type=product&amp;p=79',0,'product','',0),
	(83,2,'2013-06-07 11:33:05','2013-06-07 11:33:05','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','Woo Album #1','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','publish','open','closed','','woo-album-1','','','2013-06-07 11:33:05','2013-06-07 11:33:05','',0,'http://demo.woothemes.com/woocommerce/?post_type=product&amp;p=83',0,'product','',0),
	(87,2,'2013-06-07 11:34:14','2013-06-07 11:34:14','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','Woo Album #2','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','publish','open','closed','','woo-album-2','','','2013-06-07 11:34:14','2013-06-07 11:34:14','',0,'http://demo.woothemes.com/woocommerce/?post_type=product&amp;p=87',0,'product','',1),
	(90,2,'2013-06-07 11:35:18','2013-06-07 11:35:18','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','Woo Album #3','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','publish','open','closed','','woo-album-3','','','2013-06-07 11:35:18','2013-06-07 11:35:18','',0,'http://demo.woothemes.com/woocommerce/?post_type=product&amp;p=90',0,'product','',1),
	(93,2,'2013-06-07 11:36:34','2013-06-07 11:36:34','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','Woo Single #1','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','publish','open','closed','','woo-single-1','','','2013-06-07 11:36:34','2013-06-07 11:36:34','',0,'http://demo.woothemes.com/woocommerce/?post_type=product&amp;p=93',0,'product','',0),
	(96,2,'2013-06-07 11:37:23','2013-06-07 11:37:23','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','Woo Album #4','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','publish','open','closed','','woo-album-4','','','2013-06-07 11:37:23','2013-06-07 11:37:23','',0,'http://demo.woothemes.com/woocommerce/?post_type=product&amp;p=96',0,'product','',2),
	(99,2,'2013-06-07 11:38:12','2013-06-07 11:38:12','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','Woo Single #2','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.','publish','open','closed','','woo-single-2','','','2013-06-07 11:38:12','2013-06-07 11:38:12','',0,'http://demo.woothemes.com/woocommerce/?post_type=product&amp;p=99',0,'product','',2);

/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_term_relationships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_term_relationships`;

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`)
VALUES
	(1,1,0),
	(15,2,0),
	(15,9,0),
	(15,14,0),
	(19,2,0),
	(19,9,0),
	(19,14,0),
	(22,4,0),
	(22,6,0),
	(22,8,0),
	(22,9,0),
	(22,14,0),
	(31,2,0),
	(31,9,0),
	(31,14,0),
	(34,2,0),
	(34,9,0),
	(34,14,0),
	(37,2,0),
	(37,9,0),
	(37,14,0),
	(40,4,0),
	(40,6,0),
	(40,7,0),
	(40,9,0),
	(40,10,0),
	(47,2,0),
	(47,9,0),
	(47,10,0),
	(50,2,0),
	(50,9,0),
	(50,10,0),
	(53,2,0),
	(53,9,0),
	(53,10,0),
	(56,2,0),
	(56,9,0),
	(56,10,0),
	(60,2,0),
	(60,9,0),
	(60,10,0),
	(67,2,0),
	(67,12,0),
	(70,2,0),
	(70,12,0),
	(73,2,0),
	(73,12,0),
	(76,2,0),
	(76,12,0),
	(79,2,0),
	(79,12,0),
	(83,2,0),
	(83,11,0),
	(83,15,0),
	(87,2,0),
	(87,11,0),
	(87,15,0),
	(90,2,0),
	(90,11,0),
	(90,15,0),
	(93,2,0),
	(93,11,0),
	(93,13,0),
	(96,2,0),
	(96,11,0),
	(96,15,0),
	(99,2,0),
	(99,11,0),
	(99,13,0);

/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_term_taxonomy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_term_taxonomy`;

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`)
VALUES
	(1,1,'category','',0,1),
	(2,2,'product_type','',0,21),
	(3,3,'product_type','',0,0),
	(4,4,'product_type','',0,2),
	(5,5,'product_type','',0,0),
	(6,6,'pa_color','',0,2),
	(7,7,'pa_color','',0,1),
	(8,8,'pa_color','',0,1),
	(9,9,'product_cat','',0,12),
	(10,10,'product_cat','',9,6),
	(11,11,'product_cat','',0,6),
	(12,12,'product_cat','',0,5),
	(13,13,'product_cat','',11,2),
	(14,14,'product_cat','',9,6),
	(15,15,'product_cat','',11,4);

/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_termmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_termmeta`;

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;

INSERT INTO `wp_termmeta` (`meta_id`, `term_id`, `meta_key`, `meta_value`)
VALUES
	(1,9,'order','0'),
	(2,10,'order','0'),
	(3,11,'order','0'),
	(4,12,'order','0'),
	(5,13,'order','0'),
	(6,14,'order','0'),
	(7,15,'order','0'),
	(8,9,'product_count_product_cat','12'),
	(9,14,'product_count_product_cat','6'),
	(10,10,'product_count_product_cat','6'),
	(11,12,'product_count_product_cat','5'),
	(12,15,'product_count_product_cat','4'),
	(13,11,'product_count_product_cat','6'),
	(14,13,'product_count_product_cat','2');

/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_terms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_terms`;

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`)
VALUES
	(1,'Uncategorized','uncategorized',0),
	(2,'simple','simple',0),
	(3,'grouped','grouped',0),
	(4,'variable','variable',0),
	(5,'external','external',0),
	(6,'Black','black',0),
	(7,'Blue','blue',0),
	(8,'Green','green',0),
	(9,'Clothing','clothing',0),
	(10,'Hoodies','hoodies',0),
	(11,'Music','music',0),
	(12,'Posters','posters',0),
	(13,'Singles','singles',0),
	(14,'T-shirts','t-shirts',0),
	(15,'Albums','albums',0);

/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_usermeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_usermeta`;

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`)
VALUES
	(1,1,'nickname','admin'),
	(2,1,'first_name',''),
	(3,1,'last_name',''),
	(4,1,'description',''),
	(5,1,'rich_editing','true'),
	(6,1,'comment_shortcuts','false'),
	(7,1,'admin_color','fresh'),
	(8,1,'use_ssl','0'),
	(9,1,'show_admin_bar_front','true'),
	(10,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),
	(11,1,'wp_user_level','10'),
	(12,1,'dismissed_wp_pointers',''),
	(13,1,'show_welcome_panel','1'),
	(14,1,'session_tokens','a:1:{s:64:\"134d3daba3adc093d5013aa4f3e0e0ddfd191bca2dc21c61b8c27f16cbc16039\";a:4:{s:10:\"expiration\";i:1467776833;s:2:\"ip\";s:10:\"172.18.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36\";s:5:\"login\";i:1467604033;}}'),
	(15,1,'wp_dashboard_quick_press_last_post_id','3'),
	(16,1,'manageedit-shop_ordercolumnshidden','a:1:{i:0;s:15:\"billing_address\";}'),
	(17,2,'nickname','wooteam'),
	(18,2,'first_name',''),
	(19,2,'last_name',''),
	(20,2,'description',''),
	(21,2,'rich_editing','true'),
	(22,2,'comment_shortcuts','false'),
	(23,2,'admin_color','fresh'),
	(24,2,'use_ssl','0'),
	(25,2,'show_admin_bar_front','true'),
	(26,2,'wp_capabilities','a:1:{s:10:\"subscriber\";b:1;}'),
	(27,2,'wp_user_level','0'),
	(28,2,'dismissed_wp_pointers','');

/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_users`;

CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`)
VALUES
	(1,'admin','$P$BLOnKte1SOc0bpMDhfiAex0h9gznen0','admin','support@wcpos.com','','2016-07-04 03:46:55','',0,'admin'),
	(2,'wooteam','$P$B/y6Ct5N7MeJ/fcKWWuAbsCNU3KJk10','wooteam','','','2016-07-04 03:50:01','',0,'wooteam');

/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_woocommerce_api_keys
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_api_keys`;

CREATE TABLE `wp_woocommerce_api_keys` (
  `key_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `permissions` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_key` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_secret` char(43) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonces` longtext COLLATE utf8mb4_unicode_ci,
  `truncated_key` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_access` datetime DEFAULT NULL,
  PRIMARY KEY (`key_id`),
  KEY `consumer_key` (`consumer_key`),
  KEY `consumer_secret` (`consumer_secret`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_woocommerce_attribute_taxonomies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_attribute_taxonomies`;

CREATE TABLE `wp_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_label` longtext COLLATE utf8mb4_unicode_ci,
  `attribute_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_orderby` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`attribute_id`),
  KEY `attribute_name` (`attribute_name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_woocommerce_attribute_taxonomies` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_attribute_taxonomies` DISABLE KEYS */;

INSERT INTO `wp_woocommerce_attribute_taxonomies` (`attribute_id`, `attribute_name`, `attribute_label`, `attribute_type`, `attribute_orderby`, `attribute_public`)
VALUES
	(1,'color','color','select','menu_order',0);

/*!40000 ALTER TABLE `wp_woocommerce_attribute_taxonomies` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_woocommerce_downloadable_product_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_downloadable_product_permissions`;

CREATE TABLE `wp_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `download_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL DEFAULT '0',
  `order_key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `downloads_remaining` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permission_id`),
  KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(191),`download_id`),
  KEY `download_order_product` (`download_id`,`order_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_woocommerce_order_itemmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_order_itemmeta`;

CREATE TABLE `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_item_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `order_item_id` (`order_item_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_woocommerce_order_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_order_items`;

CREATE TABLE `wp_woocommerce_order_items` (
  `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_item_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order_id` bigint(20) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_woocommerce_payment_tokenmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_payment_tokenmeta`;

CREATE TABLE `wp_woocommerce_payment_tokenmeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payment_token_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `payment_token_id` (`payment_token_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_woocommerce_payment_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_payment_tokens`;

CREATE TABLE `wp_woocommerce_payment_tokens` (
  `token_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gateway_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`token_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_woocommerce_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_sessions`;

CREATE TABLE `wp_woocommerce_sessions` (
  `session_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `session_key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_expiry` bigint(20) NOT NULL,
  PRIMARY KEY (`session_key`),
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_woocommerce_shipping_zone_locations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zone_locations`;

CREATE TABLE `wp_woocommerce_shipping_zone_locations` (
  `location_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `zone_id` bigint(20) NOT NULL,
  `location_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `location_id` (`location_id`),
  KEY `location_type` (`location_type`),
  KEY `location_type_code` (`location_type`,`location_code`(90))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_woocommerce_shipping_zone_methods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zone_methods`;

CREATE TABLE `wp_woocommerce_shipping_zone_methods` (
  `zone_id` bigint(20) NOT NULL,
  `instance_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `method_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_order` bigint(20) NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_woocommerce_shipping_zones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zones`;

CREATE TABLE `wp_woocommerce_shipping_zones` (
  `zone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone_order` bigint(20) NOT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_woocommerce_tax_rate_locations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_tax_rate_locations`;

CREATE TABLE `wp_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `location_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate_id` bigint(20) NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `location_type` (`location_type`),
  KEY `location_type_code` (`location_type`,`location_code`(90))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_woocommerce_tax_rate_locations` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_tax_rate_locations` DISABLE KEYS */;

INSERT INTO `wp_woocommerce_tax_rate_locations` (`location_id`, `location_code`, `tax_rate_id`, `location_type`)
VALUES
	(1,'12345',5,'postcode'),
	(2,'123456',5,'postcode');

/*!40000 ALTER TABLE `wp_woocommerce_tax_rate_locations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_woocommerce_tax_rates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_woocommerce_tax_rates`;

CREATE TABLE `wp_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tax_rate_country` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT '0',
  `tax_rate_shipping` int(1) NOT NULL DEFAULT '1',
  `tax_rate_order` bigint(20) NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_id`),
  KEY `tax_rate_country` (`tax_rate_country`(191)),
  KEY `tax_rate_state` (`tax_rate_state`(191)),
  KEY `tax_rate_class` (`tax_rate_class`(191)),
  KEY `tax_rate_priority` (`tax_rate_priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_woocommerce_tax_rates` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_tax_rates` DISABLE KEYS */;

INSERT INTO `wp_woocommerce_tax_rates` (`tax_rate_id`, `tax_rate_country`, `tax_rate_state`, `tax_rate`, `tax_rate_name`, `tax_rate_priority`, `tax_rate_compound`, `tax_rate_shipping`, `tax_rate_order`, `tax_rate_class`)
VALUES
	(1,'GB','','20.0000','VAT',1,1,1,0,''),
	(2,'GB','','5.0000','VAT',1,1,1,1,'reduced-rate'),
	(3,'GB','','0.0000','VAT',1,1,1,2,'zero-rate'),
	(4,'US','','10.0000','US',1,1,1,3,''),
	(5,'US','AL','2.0000','US AL',2,1,1,4,'');

/*!40000 ALTER TABLE `wp_woocommerce_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
