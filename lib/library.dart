library core;

//! pubilc
export 'package:flutter/material.dart';
export 'package:movie_app/config/endpoints.dart';


//! Screen
export 'package:movie_app/ui/layout/home/components/movies_by_categorys.dart';
export 'package:movie_app/ui/layout/home/components/now_playing_movies.dart';
export 'package:movie_app/ui/layout/home/components/upcoming_movies.dart';
export 'package:movie_app/ui/layout/favorites/favorites_screen.dart';
export 'package:movie_app/ui/layout/home/home_screen.dart';
export 'package:movie_app/ui/layout/movie_datails/movie_details_screen.dart';
export 'package:movie_app/ui/layout/layout.dart';
export 'package:movie_app/ui/layout/trending/trending_screen.dart';

//! components
export 'package:movie_app/config/brand.dart';
export 'package:movie_app/ui/layout/favorites/favorites_icon.dart';
export 'package:movie_app/ui/components/tost.dart';


//! Package
export 'package:get/get.dart' hide FormData, MultipartFile, Response;
export 'package:flutter_svg/flutter_svg.dart';
export 'package:provider/provider.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:share_plus/share_plus.dart';
export 'package:flutter_rating_bar/flutter_rating_bar.dart';
export 'package:dio/dio.dart';
export 'package:circle_nav_bar/circle_nav_bar.dart';



//! provider
export 'package:movie_app/ui/layout/provider/layout_provider.dart';
export 'package:movie_app/ui/layout/home/provider/home_provider.dart';
export 'package:movie_app/ui/layout/movie_datails/provider/movie_details_provider.dart';
export 'package:movie_app/ui/layout/trending/provider/trending_provider.dart';
export 'package:movie_app/ui/layout/favorites/provider/favorites_provider.dart';

//! services

export 'package:movie_app/services/categorys.dart';
export 'package:movie_app/services/movies.dart';

//! models
export 'package:movie_app/models/categorys_model.dart';
export 'package:movie_app/models/movies_details_model.dart';
export 'package:movie_app/models/movies_details_model.dart';
export 'package:movie_app/models/cast_model.dart';


//! helpers
export 'package:movie_app/helpers/shared_prefs.dart';
export 'package:movie_app/helpers/dio_helper.dart';