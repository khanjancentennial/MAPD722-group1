class ApiNetwork{

  static const BASE_URL = "https://group3-mapd713.onrender.com";

  static const LOGIN_URL = "$BASE_URL/auth/login";
  static const REGISTER_URL = "$BASE_URL/auth/register";
  static const USER_URL = "$BASE_URL/auth/users";

  static const GET_ALL_PATIENRTS = "$BASE_URL/patient/list";
  static const ADD_PATIENT_DETAILS = "$BASE_URL/patient/add";
  static const DELETE_PATIENT_DETAILS = "$BASE_URL/patient/delete";
  static const EDIT_PATIENT_DETAILS = "$BASE_URL/patient/patients";

  static const SEARCH_BY_NAME = "$BASE_URL/patient/viewByName";

  static const GET_ALL_CLINICAL_TEST = "$BASE_URL/api/clinical-tests/clinical-tests";
  static const GET_ALL_CLINICAL_TEST_BY_ID = "$BASE_URL/api/clinical-tests/clinical-testsById";

  static const GET_ALL_CRITICAL_TEST = "$BASE_URL/api/clinical-tests/critical-patients";


}