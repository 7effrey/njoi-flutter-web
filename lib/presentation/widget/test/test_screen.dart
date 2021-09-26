import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_njoi_web/core/app_path.dart' as app_path;
import 'package:flutter_njoi_web/core/theme/color_constants.dart';
import 'package:flutter_njoi_web/presentation/bloc/test/test_cubit.dart';
import 'package:flutter_njoi_web/presentation/bloc/test/test_state.dart';
import 'package:url_launcher/url_launcher.dart';

class TestScreen extends StatefulWidget {
  TestScreen({Key? key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String? title;

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  late TestCubit _testCubit;

  List _isHovering = [false, false, false, false, false, false, false];
  int _selectedHeaderMenuIndex = 0;
  String _selectedLanguage = 'EN';

  List<String> _carouselUrls = [
    'assets/images/euro1.jpeg',
    'assets/images/euro2.jpeg',
    'assets/images/euro3.png',
    'assets/images/euro4.jpeg',
    'assets/images/euro5.jpeg',
  ];

  List<_Highlights> _highlights = [
    _Highlights('assets/images/highlight1.jpeg', 'Buy Sports 2021 Pass + HD Pack & Win!', 'Watch all 51 UEFA EURO 2020 live matches in HD! Buy Sports 2021 Pass with HD Pack and stand a chance to win amazing prizes! What are you waiting for? Go to Channel 200 now or download My NJOI app. Click here for more info.'),
    _Highlights('assets/images/highlight2.jpeg', 'Radhe', 'After taking the dreaded drug, mafia, a suspended officer, also known as Radhe, goes on a manhunt to find the wealthiest man in town who is secretly running a crime syndicate.'),
    _Highlights('assets/images/highlight3.png', 'Astro TVIQ now in HD', 'More fun learning on Astro TVIQ is now in HD on channel 610.'),
  ];
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _testCubit = BlocProvider.of<TestCubit>(context);
  }

  Widget _buildCounterText() {
    return BlocBuilder<TestCubit, TestState>(
      builder: (context, state) {
        if (state is UpdatedTestState) {
          return Text(
            '${state.counter}',
            style: Theme.of(context).textTheme.headline4,
          );
        }
        return Container();
      },
    );
  }

  TextStyle? _getTextStyle() {
    return Theme.of(context).textTheme.subtitle1;
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // appBar: _buildAppBar(context),
      // extendBodyBehindAppBar: true,
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Text('EXPLORE'),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildHeaderMenu('Discover', 0, () {}),
                    SizedBox(width: screenSize.width / 20),
                    _buildHeaderMenu('Contact Us', 1, () {})
                  ],
                ),
              ),
              _buildHeaderMenu('Sign Up', 2, () {}),
              SizedBox(
                width: screenSize.width / 50,
              ),
              _buildHeaderMenu('Login', 3, () {}),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildBody(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    print("ScreenWidth: $_screenWidth");
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _buildTopBanner(context),
          _buildHighlights(context),
          Stack(
            children: [
              _buildGetNjoiPrepaid(context),
              Align(
                alignment: Alignment.center,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 56),
                    child: Image.asset('assets/images/star_div.png')
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 256),
                    child: Image.asset('assets/images/star_div.png')
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  //region Top Banner
  Widget _buildTopBanner(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Image.asset(
                  "assets/images/white_njoi_171x171_rounded.png",
                  width: 70,
                ),
              ),
              Flexible(child: Container()),
              _buildLanguageButton('EN', () { }),
              SizedBox(
                width: 8,
              ),
              _buildLanguageButton('BM', () { }),
              SizedBox(
                width: 32,
              ),
              _buildActionButton('Top Up', true, () async {
                await Navigator.pushNamed(context, app_path.topup);
              }),
              _buildActionButton('Purchase', false, () async {
                await launch('https://selfservice.astro.com.my/');
              }),
              SizedBox(
                width: 16,
              )
            ],
          ),
          _buildHeaderMenus(),
          SizedBox(height: 64,),
          _buildHeaderImages(context),
          SizedBox(height: 32,),
          Text(
            'NJOI DALAM HD GERENTI PUAS HATI',
            style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16,),
          Container(
            width: _screenWidth / 2,
            child: Text(
              'Your favourite shows are now even more satisfying! Get your HD pack with 10 channels at only RM15 for 30 days.',
              style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 32,),
          OutlinedButton(
              onPressed: () {  },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                side: BorderSide(color: Colors.white, width: 2)
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Text('Buy Now'.toUpperCase(),
                  style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),
                ),
              )
          ),
          SizedBox(height: 64,),
        ],
      ),
    );
  }

  Widget _buildLanguageButton(String text, VoidCallback? onPressed) {
    bool isSelected = text == _selectedLanguage;
    return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            backgroundColor: isSelected ? Colors.white : Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            side: BorderSide(color: Colors.white, width: 1),
            minimumSize: Size(36, 36)
        ),
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Text(text.toUpperCase(),
            style: Theme.of(context).textTheme.subtitle2!.copyWith(color: isSelected ? Colors.lightGreen : Colors.white),
          ),
        )
    );
  }

  Widget _buildActionButton(String text, bool? isLeft, VoidCallback? onPressed) {
    BorderRadius borderRadius = BorderRadius.zero;
    if (isLeft == true)
      borderRadius = BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8));
    else if (isLeft == false)
      borderRadius = BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8));

    return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius
            ),
            side: BorderSide(color: Colors.white, width: 1),
            minimumSize: Size(120, 36),
            enableFeedback: true
        ),
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Text(text,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),
          ),
        )
    );
  }

  Widget _buildHeaderMenu(String text, int index, GestureTapCallback? tapCallback) {
    bool isSelected = _selectedHeaderMenuIndex == index;
    bool isHovering = _isHovering[index];
    return InkWell(
      onHover: (value) {
        setState(() {
          _isHovering[index] = value;
        });
      },
      onTap: tapCallback,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: _getTextStyle()!.copyWith(
              color: isSelected ? Colors.lightGreen : isHovering
                  ? Colors.white : Colors.white,
            ),
          ),
          SizedBox(height: 8),
          // For showing an underline on hover
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            visible: isSelected ? true : isHovering,
            child: Container(
              height: 2,
              width: 60,
              color: isSelected ? Colors.lightGreen : Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeaderMenus() {
    return Wrap(
      spacing: 16.0,
      children: [
        _buildHeaderMenu('HOME', 0, () {}),
        _buildHeaderMenu('NJOI HD', 1, () async {
          await launch('https://hd.njoi.com.my/');
        }),
        _buildHeaderMenu('PREPAID CHANNELS', 2, () {}),
        _buildHeaderMenu('TV GUIDE', 3, () {}),
        _buildHeaderMenu('LOCATION', 4, () {}),
        _buildHeaderMenu('GET NJOI PREPAID', 5, () {}),
        _buildHeaderMenu('HELP & SUPPORT', 6, () async {
          await launch('https://support.astro.com.my/category/njoi');
        }),
      ],
    );
  }

  Widget _buildHeaderImages(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    int maxSize = 1100;
    int minSize = 500;
    int numOfItems = _screenWidth >= maxSize ? 5 : _screenWidth <= minSize ? 2 : 4;
    double itemWidth = (_screenWidth - 16 * numOfItems) / numOfItems;

    String middleItem = _carouselUrls[2];

    // width = 150, 275
    double? containerSize = null;
    Iterable<String> items;
    if (_screenWidth >= maxSize) {
      items = _carouselUrls;
      if (itemWidth > 150) {
        containerSize = 150;
      }
    } else if (_screenWidth <= minSize) {
      items = _carouselUrls.where((element) => element == middleItem);
    } else {
      items = _carouselUrls.where((element) => element != middleItem);
      if (itemWidth > 150) {
        containerSize = 150;
      }
    }
    // print("ItemWidth: $itemWidth | $numOfItems | $containerSize");

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      spacing: 8,
      children: items.map((item) => Container(
        width: item == middleItem ? 275: containerSize,
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            child: Image.asset(
              item,
              width: item == middleItem ? 275: itemWidth,
            ),
        ),
      )).toList(),
    );
  }
  //endregion

  //region Highlights
  Widget _buildHighlights(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          Text(
            'HIGHLIGHTS',
            style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Get your NJOI Prepaid decoder now and start watching your favourite shows.',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 32,
          ),
          _buildHighlightsCarousel2(context),
          // SmoothPageIndicator(
          //   controller: _pageController,
          //   count: 3,
          //   effect: ExpandingDotsEffect(
          //       dotWidth: 6,
          //       dotHeight: 6,
          //       spacing: 6,
          //       activeDotColor: Colors.white,
          //       dotColor: ColorConstant.white40,
          //       expansionFactor: 4),
          // ),
          SizedBox(
            height: 64,
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightsCarousel2(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    int minSize = 500;
    double itemWidth = 400;
    double viewportFraction = 0.85;

    if (_screenWidth <= minSize) {
      itemWidth = _screenWidth / 2;
      viewportFraction = 0.55;
    } else {
      itemWidth = _screenWidth / 4;
      viewportFraction = 0.275;
    }

    int maxLength = 200000;
    int initialPage = (maxLength / 2 - (maxLength / 2 % _highlights.length)) as int;

    setState(() {
      _pageController = PageController(viewportFraction: viewportFraction, initialPage: initialPage);
    });

    return Container(
      height: 466,
      // color: Colors.orange,
      child: PageView.builder(
        physics: ClampingScrollPhysics(),
        itemCount: maxLength,
        onPageChanged: (int page) {
          // Set Circle Pager Indicator
        },
        controller: _pageController,
        itemBuilder: (context, index) {
          _Highlights item = _highlights[index % _highlights.length];
          return Column(
            children: [
              Image.asset(
                item.imageAsset,
                width: itemWidth,
              ),
              Container(
                width: itemWidth,
                height: 4,
                color: Colors.lightGreen,
              ),
              Container(
                  width: itemWidth,
                  constraints: BoxConstraints(
                    minHeight: 180,
                  ),
                  color: Colors.black,
                  child: Padding(
                    padding: EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.lightGreen),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          item.description,
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),
                          textAlign: TextAlign.left,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,

                        ),
                      ],
                    ),
                  )
              )
            ],
          );
        },
      ),
    );
  }
  //endregion

  //region Get NJOI Prepaid
  Widget _buildGetNjoiPrepaid(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          color: Colors.lightGreen,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'There’s literally nothing better than watching TV with NO COMMITMENT.',
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: OutlinedButton(
                    onPressed: () {  },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                      side: BorderSide(color: Colors.black, width: 2),
                      backgroundColor: Colors.black,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Text('Get NJOI\nPrepaid!',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ),
        ),
        Image.asset('assets/images/why_choose_us.jpeg'),
        Image.asset('assets/images/dealers.jpeg'),
      ],
    );
  }
  //endregion
}

class _Highlights {
  String imageAsset;
  String title;
  String description;

  _Highlights(this.imageAsset, this.title, this.description);
}
