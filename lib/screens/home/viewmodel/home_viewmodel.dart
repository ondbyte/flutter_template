import './../../../enum/enum.dart';
import './../../../config/config.dart';
import './../../../models/model.dart';
import './../../../services/services.dart';
import './../../../../viewmodels/base_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel extends BaseViewModel {
  UserService userService = locator<UserService>();
//  MenuService menuService = locator<MenuService>();
//  OfferService offerService = locator<OfferService>();
//  MessagesService messagesService = locator<MessagesService>();

  User user;

//  List<Items> featuredItems;
//  List<Messages> userUnreadMessages;
//  Offer offer;

  void initialise() {
    setState(ViewStateType.Busy);
    _updateUserInfo();
    notifyListeners();
  }

  Future<void> _updateUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('userId');

    user = await userService.getUser(id);
//    userUnreadMessages = await messagesService.getUnreadUserMessages(id);
//    featuredItems = await menuService.getFeaturedItems(id);
//    offer = await offerService.getOffer(1);

    setState(ViewStateType.Completed);
    notifyListeners();
  }
}
