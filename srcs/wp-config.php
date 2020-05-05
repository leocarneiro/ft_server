<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wordpress_user' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/** Set the method that WordPress should use to write to the filesystem. */
define( 'FS_METHOD', 'direct' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

define('AUTH_KEY',         '`nL<y:I~No?Qv#zGF*z@?TqE7C7AA |#=)sGmt;o>ejCENnX2BJ;PX{=EB-%%UUP');
define('SECURE_AUTH_KEY',  'i)-W|uw>0uy|y!5-L0w^k:h~F^_jW uUAO.Up.iPq[gJQZBd^8Eh-M)mtME3mG@!');
define('LOGGED_IN_KEY',    'dV9Y`5d[ob>[E7QmE-5_E/-+9oW;WxCFy& n3>Ve0RE,J4_Jdv_8;|cRt:Bjg!~}');
define('NONCE_KEY',        '=BJtZ.<mj]:ZbCe:vdziCfH6NxCyba75}26wxblZ!v; TP2uc|i}zO6A^cIA|/t[');
define('AUTH_SALT',        'D4:!~gO8o>.>bcsVkIdJWCyBas&:wj&4?-MIN-Vnx!0n**S*0umlTBfwiVlfJgZP');
define('SECURE_AUTH_SALT', 'Q:)B}W?(T,IPvGh.h/.t|+mAa0Y,1*;zDMM|kO+{?Q[!am 5$IN;*^/_,WYIHdE6');
define('LOGGED_IN_SALT',   'F3?+n_ScQKr|gp-Q>;a|$s~dl*HRWhaR6i]Xe<-]OO_oV8PD30aX!Qzgg#>[:PDc');
define('NONCE_SALT',       'ahx6i]TR{0(n]=@IcPOl^d<?l]+l+i.uZq/l,hInR|@Mv6,:>q BGeVU/4ZY$rz2');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
