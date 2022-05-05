


import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  static const PET_NAME ="petName" ;
  static const PET_BREED="petBreed";
  static const OWNER_NAME="ownerName";
  static const PET_SEX="petSex";
  static const WHATSAPP= "whatsapp";
  static const CONTACT_PHONE="contactPhone";
  static const IMAGE = "image";
  static const OWNER_SURNAME= "ownerSurname";
  static const BANNER_IMAGE="bannerImage";
  static const JWTTOKEN= "jwtToken" ;
  static const ID ="_ID" ;
  static const VERIFY_STATUS="verifyStatus";
  static const EMAIL="email";
  static const PET_BIRTH_DATE="petBirthDate";
  static const ADDRESS="address";
  static const VETERINARYNUMBER="veterinaryNumber";
  static const DESCRIPTION="description";
  static SharedPreferences? prefs;

  static clearSharedpref () async{
    prefs?.remove(PET_NAME);
    prefs?.remove(PET_BREED);
    prefs?.remove(OWNER_NAME);
    prefs?.remove(PET_SEX);
    prefs?.remove(WHATSAPP);
    prefs?.remove(CONTACT_PHONE);
    prefs?.remove(IMAGE);
    prefs?.remove(OWNER_SURNAME);
    prefs?.remove(BANNER_IMAGE);
    prefs?.remove(JWTTOKEN);
    prefs?.remove(ID);
    prefs?.remove(VERIFY_STATUS);
    prefs?.remove(EMAIL);
    prefs?.remove(PET_BIRTH_DATE);
    prefs?.remove(ADDRESS);
    prefs?.remove(VETERINARYNUMBER);
    prefs?.remove(DESCRIPTION);
  }
}