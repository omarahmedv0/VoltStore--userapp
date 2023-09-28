class ApiLinks {
  // static const _baseUrl = 'http://10.0.2.2/e-commerce-app';
  static const _baseUrl = 'http://192.168.1.9/e-commerce-app';

  //------------------------- IMAGES------------------------
  static const categoriesImageLink = '$_baseUrl/upload/categories';
    static const bannersImageLink = '$_baseUrl/upload/banners';

  static const productsImagesLink = '$_baseUrl/upload/products';
  static const notificationsImagesLink = '$_baseUrl/upload/notify';
  static const profileImagesLink = '$_baseUrl/upload/userprofile';
  static const onboardingImage = '$_baseUrl/upload/onboarding';

  //------------------------- AUTH------------------------
  static const signupLink = '$_baseUrl/auth/signup.php';
  static const loginLink = '$_baseUrl/auth/login.php';

  //-------------------------HOME------------------------
  static const homeLink = '$_baseUrl/home/home_data.php';

  // ----------------- PRODUCTS -------------------
  static const productsLink = '$_baseUrl/products/get_products_data.php';
  static const getProductColor = '$_baseUrl/products/get_colors.php';
  static const getProductSize = '$_baseUrl/products/get_size.php';

  //------------------------- FAVORITE ------------------------
  static const addFavLink = '$_baseUrl/favorite/add.php';
  static const deleteFavLink = '$_baseUrl/favorite/delete.php';
  static const getFavoriteLink = '$_baseUrl/favorite/get_favorite.php';

  //------------------------- CART ------------------------
  static const addCartLink = '$_baseUrl/cart/add.php';
  static const deleteCartLink = '$_baseUrl/cart/delete.php';

  static const decreaseQuantity = '$_baseUrl/cart/decreasequantity.php';
  static const increaseQuantity = '$_baseUrl/cart/increasequantity.php';
  static const getCartLink = '$_baseUrl/cart/get_cart.php';
  static const checkCoupon = '$_baseUrl/coupon/check_coupon.php';

  //------------------------- SEARCH ------------------------
  static const getSearchDataLink = '$_baseUrl/products/search.php';

  //------------------------- ADDRESS ------------------------
  static const addAddress = '$_baseUrl/address/add.php';
  static const editAddress = '$_baseUrl/address/edit.php';
  static const getCities = '$_baseUrl/address/get_cities.php';
  static const getAddress = '$_baseUrl/address/get_address.php';
  //------------------------- Payments ------------------------
  static const paymentGatewayStripe =
      'https://api.stripe.com/v1/payment_intents';
  static const secretKeyStripe =
      'key';
  static const publishableKeyStripe =
      'key';

  //------------------------- Checkout ------------------------
  static const checkout = '$_baseUrl/orders/checkout.php';
  static const getShippingCost = '$_baseUrl/orders/get_shipping_cost.php';

  //------------------------- MY Orders ------------------------
  static const getOrdersData = '$_baseUrl/orders/get_orders.php';
  static const getOrderDetails = '$_baseUrl/orders/myordersdetails.php';
  static const cancelOrder = '$_baseUrl/orders/cancel.php';
  static const getOrdersReceived = '$_baseUrl/orders/get_orders_received.php';

  //------------------------- NOTIFICATIONS ------------------------
  static const getNotifications =
      '$_baseUrl/notifications/get_notifications.php';

  //------------------------- RATING ------------------------
  static const addRate = '$_baseUrl/rating/add_rate.php';
  static const myRating = '$_baseUrl/rating/myrating.php';
  static const productRating = '$_baseUrl/rating/products_rating.php';
  static const checkRate = '$_baseUrl/rating/check_rate.php';
  static const getRating = '$_baseUrl/rating/get_rating.php';
  static const editRate = '$_baseUrl/rating/edit_rate.php';

  //------------------------- USERS ------------------------
  static const getUserData = '$_baseUrl/user_profile/get_user_data.php';
  static const editProfile = '$_baseUrl/user_profile/edit.php';

    //------------------------- Onnboarding ------------------------
  static const getOnboardingData = '$_baseUrl/onboarding/get_onboardingdata.php';
}
