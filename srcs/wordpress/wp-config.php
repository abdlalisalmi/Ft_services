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
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress_db' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'daptE:)Vn93TG8udOxmuoAsAp-R9J+Ve]);a`<<x?/k#eCjVt1O<2+Z8<o8Ufw#-');
define('SECURE_AUTH_KEY',  '*M<e}2T.)XtCYF9}wD,a1h2Dyb#YRx_aNkT MV*Oel/jMr-lx5E-L A;8{=Sa`>*');
define('LOGGED_IN_KEY',    '--D0ip|KpD_hXMrJqW40O?Q*Sar2+HS)VMupZzUPtzwg{j+Fa84>FarR<ssb++Bu');
define('NONCE_KEY',        'EEpvgP+MF(<bSszR]]=NraO[7v/uN<@e|R`r!OO2kC=MpM%Hj1{RRjI;uK^4`jzi');
define('AUTH_SALT',        '={Rn:QEErTK_{@a{@o]AWmHvlJL$O;31 s-vJ-M1+*3fIPZ]ep-9c6*PS[6DU0%{');
define('SECURE_AUTH_SALT', '[+-XcW)PhxHpJIg*(US0tscB^~nn$X.a]#6Jw@]1-1Nu@x0?TwU/g|xV@.Thn]&Y');
define('LOGGED_IN_SALT',   'U%3Z+!Lg8fyYY73;P-GN5;q+=9DdKBr1F;QcI8PZ.+r5|*_DY-RH](,n!PZ]+svJ');
define('NONCE_SALT',       '0~|V?k[XR=:+^RCw_wu1Y`j3/1yGpHYJjW+|T54pn@|ZK`+{&;[D[dI#C|D;y5Xn');

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
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', true );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
