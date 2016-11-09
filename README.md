# iOS-Login-LeftMenu-Template

#Uses library:
  * [ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa)
  * [AFNetworking](https://github.com/AFNetworking/AFNetworking)
  * [MBProgressHUD](https://github.com/jdg/MBProgressHUD)
  * [EasyMapping](https://github.com/lucasmedeirosleite/EasyMapping)
  * [SlideMenu](https://github.com/aryaxt/iOS-Slide-Menu)
  * [TPKeyboard](https://github.com/michaeltyson/TPKeyboardAvoiding)
  
[![export.png](https://s11.postimg.org/w8zocnv37/export.png)](https://postimg.org/image/zfu7wafj3/)

###Model

####WebService
   Implementation communications with REST API service. Using [AFNetworking](https://github.com/AFNetworking/AFNetworking) library.

####RequestMapManager
  Gets response with WebService, and transfers a NSDictionary(JSON) in object entity. 
   Model object realized via [EasyMapping](https://github.com/lucasmedeirosleite/EasyMapping) for transformation NSDictionary(JSON) in model.
  
####UserModel
  Model for response REST API.
