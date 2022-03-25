


import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  static const DOG_NAME ="dogName" ;
  static const DOG_BREED="dogBreed";
  static const OWNER_NAME="ownerName";
  static const DOG_SEX="dogSex";
  static const WHATSAPP= "whatsapp";
  static const CONTACT_PHONE="contactPhone";
  static const IMAGE = "image";
  static const OWNER_SURNAME= "ownerSurname";
  static const BANNER_IMAGE="bannerImage";
  static const JWTTOKEN= "jwtToken" ;
  static const ID ="_ID" ;
  static const VERIFY_STATUS="verifyStatus";
  static const EMAIL="email";
  static const DOG_BIRTH_DATE="dogBirthDate";
  static const ADDRESS="address";
  static const VETERINARYNUMBER="veterinaryNumber";
  static const DESCRIPTION="description";
  static SharedPreferences? prefs;

  static clearSharedpref () async{
    prefs?.remove(DOG_NAME);
    prefs?.remove(DOG_BREED);
    prefs?.remove(OWNER_NAME);
    prefs?.remove(DOG_SEX);
    prefs?.remove(WHATSAPP);
    prefs?.remove(CONTACT_PHONE);
    prefs?.remove(IMAGE);
    prefs?.remove(OWNER_SURNAME);
    prefs?.remove(BANNER_IMAGE);
    prefs?.remove(JWTTOKEN);
    prefs?.remove(ID);
    prefs?.remove(VERIFY_STATUS);
    prefs?.remove(EMAIL);
    prefs?.remove(DOG_BIRTH_DATE);
    prefs?.remove(ADDRESS);
    prefs?.remove(VETERINARYNUMBER);
    prefs?.remove(DESCRIPTION);
  }
}