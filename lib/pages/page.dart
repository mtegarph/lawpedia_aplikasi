import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:floating_pullup_card/floating_pullup_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_placeholder_textlines/placeholder_lines.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lawpedia_app/cubit/cubit.dart';
import 'package:lawpedia_app/model/model.dart';
import 'package:lawpedia_app/widget/widget.dart';
import 'package:flutter_paginator/flutter_paginator.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_row_column.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supercharged/supercharged.dart';
import 'package:get/get.dart';
import 'package:lawpedia_app/services/service.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:http/http.dart' as http;

part 'konsultan_hukum.dart';
part 'search_page.dart';
part 'login.dart';
part 'homepage.dart';
part 'main_page.dart';
part 'list_arsip.dart';
part 'answer.dart';
part 'setting.dart';
part 'notifikasi.dart';
part 'artikel.dart';
part 'detail_artikel.dart';
part 'inbox.dart';
part 'chat.dart';
part 'hasil_search.dart';
part 'notif.dart';
part 'kamus_hukum.dart';
part 'arsip_konsultasi.dart';
part 'user-edit.dart';
part 'detail_konsultan.dart';