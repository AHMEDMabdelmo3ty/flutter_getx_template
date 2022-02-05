# flutter_getx_template

### Hi there 👋, my name is ahmed abdelmoty
![Profile views](https://gpvc.arturio.dev/AHMEDMabdelmo3ty)  
#### About me
I'm Flutter Developer from Egypt.
- Flutter developer .
- Good knowledge of firebase real time database ( Online Database ) .
- Good knowledge of Sqllite ( Offline Database ) .
- Good knowledge with Restful APIS using Dio and Http Package .
- Familiarity with GitHub .
- Good knowledge of Shared Preference Database .
- Good knowledge of State Management ( Bloc ) .

#### Technical Skills
- python
- java
- Html & css 
- Object Oriented Programming ( OOP )
- Problem Solving
- solid principles
- Strapi as aback end 
- Dart
- Flutter
- Firebase Database
- Firebase Authentication
- REST APIS ( Dio & HTTP Packages )
- Shared Preference Database
- SQLlite
- Localization
- Animation
- State Management ( Getx )
- State Management ( Provider )


- 🔭 I’m currently working on improving my skills as a mobile application developer. 

#### My Respositories
- shibin app Link => https://github.com/AHMEDMabdelmo3ty/shop_abdelmo3ty
- to do app Link => https://github.com/AHMEDMabdelmo3ty/todo .
- ecommerceApp (Full E-commerce App) Link => https://github.com/AHMEDMabdelmo3ty/ecommerceApp .
- lamtna (Full Social App) Link => https://github.com/AHMEDMabdelmo3ty/lamtna_abdelmo3ty .
- covid app Link =>https://github.com/AHMEDMabdelmo3ty/covid_19_eg.
- qr-scan app Link => https://github.com/AHMEDMabdelmo3ty/qr-scan.



[<img src='https://cdn.jsdelivr.net/npm/simple-icons@3.0.1/icons/github.svg' alt='github' height='40'>](https://github.com/AHMEDMabdelmo3ty/)  [<img src='https://cdn.jsdelivr.net/npm/simple-icons@3.0.1/icons/linkedin.svg' alt='linkedin' height='40'>](https://www.linkedin.com/in/ahmed-abdelmo3ty-1513bb204/)  [<img src='https://cdn.jsdelivr.net/npm/simple-icons@3.0.1/icons/facebook.svg' alt='facebook' height='40'>](https://www.facebook.com/profile.php?id=100002802938518)  

![GitHub stats](https://github-readme-stats.vercel.app/api?username=AHMEDMabdelmo3ty)  

[![trophy](https://github-profile-trophy.vercel.app/?username=AHMEDMabdelmo3ty)](https://github.com/AHMEDMabdelmo3ty?tab=repositories)


- 💥 `flutter`
- 🍀 `view`  `逻辑` 
- ⚡ `view`  `state` 
- 📦  `dio`、`shared_preferences`
- 🔥 `context`

### 

```
Flutter 2.2.0 • channel stable • https://github.com/flutter/flutter.git
Framework • revision b22742018b (3 weeks ago) • 2021-05-14 19:12:57 -0700
Engine • revision a9d88a4d18
Tools • Dart 2.13.0
```


### lib



- `common`
  
lang `colors`、`langs`、`values`：

```
├── colors
│   └── colors.dart
├── langs
│   ├── en_US.dart
│   ├── translation_service.dart
│   └── zh_Hans.dart
└── values
    ├── cache.dart
    ├── storage.dart
    └── values.dart
  
```

- `components`

This directory mainly stores top-level announcement components, such as `appbar`、`scaffold`、`dialog`for example：

```
├── components.dart
├── custom_appbar.dart
└── custom_scaffold.dart
```

- `pages`
  
This directory mainly stores page files, such as：

> Note: Each Item is a folder.

```
├── Index
├── home
├── login
├── notfound
├── proxy
└── splash

```

- `router`
  
This directory is the routing file. The routing convention of this template is `named routing`, which is a fixed directory. The directory structure is as follows：

```
├── app_pages.dart
└── app_routes.dart

```

- `services`

This directory is used to store `API`, for example:
```
├── services.dart
└── user.dart  // 关于用户的API
```

- `utils`

This directory is used to store some tool modules, such as `request`, `local_storage`, etc., for example：

```
├── authentication.dart
├── local_storage.dart
├── request.dart
├── screen_device.dart
└── utils.dart
```
### Development Specifications

When you need to create a new page, you need to follow the steps below:

> Suppose we now want to create a `Home` page.

1. Create a new `home` directory under the `pages` directory:
```shell
// pages

$ mkdir home
$ cd home
```

2. In the `home` directory, create the following four files：

- `home_view.dart` :View (used to implement page layout)

- `home_contrller.dart` : Controller (used to implement business logic)

- `home_binding` :Controller binding (used to bind `controller` to `view`)

- `home_model` : Data model (used to agree on the data model)

Note: You must do this every time you create a page, naming it in the form '`pagename_key`'.

When you create a page, the table of contents should look like this👇：

```
// home
.
├── home.binding.dart
├── home_controller.dart
├── home_model.dart
└── home_view.dart
```

1. 到`router`文件夹下面添加对应路由:

```dart
// app_routes.dart
part of 'app_pages.dart';
abstract class AppRoutes {
  ...
  static const Home = '/home';
  ...
}
```

```dart
// app_pages.dart
class AppPages {

  static final routes = [
    ...
    GetPage(
      name: AppRoutes.Home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    ...
  ];
}
```

After completing the above steps, you can start developing happily.



### States Management

`contrller` is where we implement the business logic, why do we separate the business logic from the view? Because the spaghetti code of `flutter` is too difficult to maintain, the page layout and style of `flutter` are disgusting to be written together, plus the business logic code, it is too difficult to maintain, and if If we want to have state, our page has to inherit from `stateful widget`, and the performance penalty is too serious.

So we use the `controller` provided by `getx` to decouple our business logic from the view.

A standard `controller` looks like this:
```dart
class HomeController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;
}
```

When we need a reactive variable, we just add a `.obs` after the variable, for example:
```dart
final name = ''.obs;
final isLogged = false.obs;
final count = 0.obs;
final balance = 0.0.obs;
final number = 0.obs;
final items = <String>[].obs;
final myMap = <String, int>{}.obs;

//even custom classes - can be any class
final user = User().obs;
```
> It's worth noting that since `flutter` now has `null-safety`, it is better to give reactive variables an initial value.

When we update the reactive variable in the `controller`, the view will automatically update the rendering.

But in fact, you can also not define this kind of reactive variable, for example, we can do this:


```dart
class HomeController extends GetxController {
  int count = 0;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() {
    count++;
    update();
  } 
}
```

The only difference between this and `.obs` is that we need to manually call `update()` to update the state changes, so that the `view` can receive our notification to re-render when the `count` changes.


We should place the request in the `onInit` hook. For example, when entering the order page, we should get the order information, just like the `init` hook in `stateful wdiget`.


### view

First, you need to inherit your `class` from `GetxView<T>` (T is your Controller), for example:
```dart
class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
```

`GetxView<HomeController>` will automatically help you inject `Controller` into `view`, you can simply understand that it automatically performs the following steps for you
```dart
final controller = Get.find<HomeController>();
```
Don't worry about the performance of `GetxView<T>` because it just inherits from `Stateless Widget`, remember, with `getx` you don't need `Stateful Widget` at all


When we want to bind `controller` variables, we agree on two methods:

1. `Obx(()=>)`

If your variable is `.obs`, then we use `Obx(()=>)`, which will automatically refresh the `view` when the variable changes, for example:
```dart
// home_contrller
class HomeController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;
}
```
在`view`里面使用 `Obx(()=>)` 绑定`count`:

```dart
// home_view
class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Obx(() => Center(child: Text(controller.count.toString()))),
      ),
    );
  }
}
```

2. `GetBuilder<T>`
If your variable is not `.obs`, then we use `GetBuilder<T>`, for example:

```dart
class HomeController extends GetxController {
  int count = 0;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() {
    count++;
    update();
  } 
}
```

Use `GetBuilder<T>` to bind `count` inside `view`:
```dart
class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: MyAppBar(
        centerTitle: true,
        title: MyTitle('首页'),
        leadingType: AppBarBackType.None,
      ),
      body: Container(
        child: GetBuilder<HomeController>(builder: (_) {
          return Center(child: Text(controller.count.toString()));
        }),
      ),
    );
  }
}
```
In fact, `getx` also provides other [`render function`](https://github.com/jonataslaw/getx/issues/1499), but in order to reduce mental burden and complexity, we just use these two. .



### Routing management

Here we use the named routing provided by `getx`. If you have learned `vue`, there is almost no learning cost.

Suppose we now add a page called `List`, then we need to go to the `router` folder to configure it:
```dart
// app_routes.dart
part of 'app_pages.dart';
abstract class AppRoutes {
  ...
  static const List = '/list';
  ...
}
```

```dart
// app_pages.dart
class AppPages {

  static final routes = [
    ...
    GetPage(
      name: AppRoutes.Home,
      page: () => ListPage(),
      binding: ListBinding(),
    ),
    ...
  ];
}
```
The hypothesis corresponding to this `List` is an order list. When we click on an order in the list, we usually enter the order details page, so we should add another details page at this time:
```dart
// app_routes.dart
part of 'app_pages.dart';
abstract class AppRoutes {
  ...
  static const List = '/list';
  static const Detaul = '/detail';
  ...
}
```

```dart
// app_pages.dart
class AppPages {

  static final routes = [
    ...
    GetPage(
      name: AppRoutes.Home,
      page: () => ListPage(),
      binding: ListBinding(),
      children: [
        GetPage(
          name: AppRoutes.Detail,
          page: () => DetailPage(),
          binding: DetailBinding(),
        ),
      ],
    ),
    ...
  ];
}
```
Because the detail page and the list page have a hierarchical relationship, we can put the `Detail` page under the `children` of the `List`, of course, you can also not do this.

When we use:

```dart
Get.toNamed('/list/detail');
```

Other routing hooks:

Browse and delete the previous page:
```dart
Get.offNamed("/NextScreen");
```
