<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	http://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There area two reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router what URI segments to use if those provided
| in the URL cannot be matched to a valid route.
|
*/
// $route["track/([a-z0-9-]{4,255})/([a-z0-9-]{4,255})"] = "scooter/track/detail/$1/$2";
// $route["track/([a-z0-9-]{4,255})/page/([0-9]{1,3})"] = "scooter/track/cat/$1/$2";
// $route["track/([a-z0-9-]{4,255})/page"] = "scooter/track/cat/$1/1";
// $route["track/([a-z0-9-]{4,255})"] = "scooter/track/cat/$1/1";
// $route["track/page/([0-9]{1,3})"] = "scooter/track/cat/all/$1";
// $route["track"] = "scooter/track/cat/all/1";

// $route["story/([a-z0-9-]{4,255})/page/([0-9]{1,3})"] = "scooter/news/cat/all/$2";
// $route["story/([a-z0-9-]{4,255})/page"] = "scooter/news/cat/all/1";

// $route["story/page/([0-9]{1,3})"] = "scooter/news/cat/all/$1";
// $route["story/page"] = "scooter/news/cat/all/1";
// $route["story/([a-z0-9-]{4,255})"] = "scooter/news/detail/all/$1";
// $route["story"] = "scooter/news/cat/all/1";

// $route["contact"] = "home/contact";
// $route["account"] = "frontend/account";
// $route["account/orders"] = "frontend/account/orders";
// $route["cart"] = "frontend/cart";
// $route["checkout"] = "frontend/cart/checkout";

// $route["about/([a-z0-9-]{4,255})"] = "home/about/$1";
// $route["service/([a-z0-9-]{4,255})"] = "home/service/$1";
// $route["service"] = "home/service/";
// $route["membership"] = "home/membership";

// $route["about"] = "home/site/2";
// $route["gears"] = "home/site/3";
// $route["customer-service"] = "home/site/4";
// $route["terms"] = "home/site/5";
// $route["testimonial"] = "home/site/6";
// $route["faq"] = "home/site/7";


$route["project"] = "frontend/product/cat/416";
$route["real-estate"] = "frontend/product/real_estate";
$route["invest"] = "frontend/product/invest";
$route["selling"] = "frontend/product/selling";
$route["rent"] = "frontend/product/rent";
$route["project/(:num)"] = "frontend/product/real_estate/$1";
$route["real-estate/(:num)"] = "frontend/product/cat/420/$1";
$route["invest/(:num)"] = "frontend/product/invest/$1";
$route["selling/(:num)"] = "frontend/product/selling/$1";
$route["rent/(:num)"] = "frontend/product/rent/$1";
$route["project/detail/(:num)"] = "frontend/product/detail/$1";
$route["partner"] = "frontend/news/partner";
$route["partner/detail/(:num)"] = "frontend/news/partner_detail/$1";
$route["blogs/detail/(:num)"] = "frontend/news/detail/$1";



$route["(gioi-thieu|about)"] = "home/about";
$route["gioi-thieu/(:any)"] = "home/about/$1";
$route["(cong-trinh|quan-tam|thiet-ke)/([a-z0-9-]{4,255})"] = "frontend/product/detail/$2";
$route["cong-trinh"] = "frontend/product/cat/408";
$route["quan-tam"] = "frontend/product/cat/409";
$route["thiet-ke"] = "frontend/product/cat/410";
$route["noi-that"] = "frontend/product/noithat";
$route["cataloue"] = "home/cataloue";
$route["(lien-he|tu-van)"] = "home/contact";
$route["tu-van/(:any)"] = "realestate/advisory/detail/$1";

$route["(cong-trinh|quan-tam|thiet-ke)/([a-z0-9-]{4,255})"] = "frontend/product/detail/$2";

$route["(tin-tuc|thong-bao|blogs)/page"] = "frontend/news/cat/$1/1";
$route["(tin-tuc|thong-bao|blogs)/([a-z0-9-]{4,255})"] = "frontend/news/detail/$1/$2";
$route["(tin-tuc|thong-bao|blogs)/page/([0-9]{1,3})"] = "frontend/news/cat/$1/$2";
$route["(tin-tuc|thong-bao)"] = "frontend/news/cat/$1";
$route["(blogs)"] = "frontend/news/cat/";

// $route["(news|event)/([a-z0-9-]{4,255})/page/([0-9]{1,3})"] = "frontend/$1/cat/$2/$3";
// $route["(news|event)/([a-z0-9-]{4,255})/page"] = "frontend/$1/cat/$2/1";
// $route["(news|event)/page/([0-9]{1,3})"] = "frontend/$1/cat/all/$2";
// $route["(news|event)/page"] = "frontend/$1/cat/all/1";
// $route["(news|event)/([a-z0-9-]{4,255})/([a-z0-9-]{4,255})"] = "frontend/$1/detail/$2/$3";
// $route["(news|event)/([a-z0-9-]{4,255})/([0-9]{1,3})"] = "frontend/$1/cat/$2/$3";
// $route["(news|event)/([a-z0-9-]{4,255})"] = "frontend/$1/cat/$2/1";
// $route["(news|event)/([0-9]{1,3})"] = "frontend/$1/cat/all/$2";
// $route["(news|event)"] = "frontend/$1/cat/all/1";



$route['default_controller'] = "home";
$route['404_override'] = '';


/* End of file routes.php */
/* Location: ./application/config/routes.php */