class Urls{
  static final String BASE_URL = "https://www.marketcraft.in/ecommerce-api/";

  ///user onboarding
  static final String USER_URL = "${BASE_URL}user/";
  static final String REGISTER_URL = "${USER_URL}registration";
  static final String LOGIN_URL = "${USER_URL}login";
  static final String GET_PRODUCT_URL = "${BASE_URL}products";
  static final String GET_CATEGORY_URL = "${BASE_URL}categories";
  static final String ADD_TO_CART_URL = "${BASE_URL}add-to-card";
  static final String FETCH_CART_URL = "${BASE_URL}product/view-cart";
  static final String CREATE_ORDER_URL = "${BASE_URL}product/create-order";
  static final String GET_PLACED_ORDER = "${BASE_URL}product/get-order";
  static final String USER_PROFILE_URL = "${USER_URL}user/profile";
}