import 'package:fluent_ui/fluent_ui.dart';
import 'package:hotel_management_retailer/main.dart';
import 'package:hotel_management_retailer/theme.dart';
import 'package:hotel_management_retailer/view/home/home_page.dart';
import 'package:hotel_management_retailer/view/room_booking/add_room.dart';
import 'package:hotel_management_retailer/view/rooms/room_types.dart';
import 'package:hotel_management_retailer/view/setting/setting.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart' as flutter_acrylic;
import 'package:provider/provider.dart';
import 'package:system_theme/system_theme.dart';
import 'package:url_launcher/link.dart';


class MasterDetailView extends StatefulWidget {
  const MasterDetailView({Key? key}) : super(key: key);

  @override
  _MasterDetailViewState createState() => _MasterDetailViewState();
}

class _MasterDetailViewState extends State<MasterDetailView> with WindowListener {
  bool value = false;

  int index = 0;

  final viewKey = GlobalKey();

  final searchKey = GlobalKey();
  final searchFocusNode = FocusNode();
  final searchController = TextEditingController();

  final List<NavigationPaneItem> originalItems = [
    PaneItem(
      icon: const Icon(FluentIcons.home),
      title: const Text('Home'),
      body: const HomePage(),
    ),

    PaneItemHeader(header: const Text('Booking')),
    PaneItem(
      icon: const Icon(FluentIcons.bulleted_list),
      title: const Text('All Bookings'),
      body: HomePage(),
    ),
    PaneItem(
      icon: const Icon(FluentIcons.cloud_add),
      title: const Text('Add Booking'),
      body: const AddRoom(),
    ),

    PaneItemHeader(header: const Text('Room')),
    PaneItem(
      icon: const Icon(FluentIcons.room),
      title: const Text('All Rooms'),
      body: HomePage(),
    ),
    PaneItem(
      icon: const Icon(FluentIcons.column_left_two_thirds),
      title: const Text('Room Types'),
      body: const RoomTypes(),
    ),

    PaneItemHeader(header: const Text('Package')),
    PaneItem(
      icon: const Icon(FluentIcons.bulleted_list),
      title: const Text('All Package'),
      body: HomePage(),
    ),


  ];
  final List<NavigationPaneItem> footerItems = [
    PaneItemSeparator(),
    PaneItem(
      icon: const Icon(FluentIcons.settings),
      title: const Text('Settings'),
      body:  Settings(),
    ),
  ];

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppTheme>();
    final theme = FluentTheme.of(context);
    return NavigationView(
      key: viewKey,
      appBar: NavigationAppBar(
        automaticallyImplyLeading: false,
        title: () {
          if (kIsWeb) {
            return const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(appTitle),
            );
          }
          return const DragToMoveArea(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(appTitle),
            ),
          );
        }(),
        actions: Row(mainAxisAlignment: MainAxisAlignment.end, children: [

          Padding(
            padding: const EdgeInsetsDirectional.only(end: 8.0),
            child: ToggleSwitch(
              content: const Text('Dark Mode'),
              checked: FluentTheme.of(context).brightness.isDark,
              onChanged: (v) {
                if (v) {
                  appTheme.mode = ThemeMode.dark;
                } else {
                  appTheme.mode = ThemeMode.light;
                }
              },
            ),
          ),
          if (!kIsWeb) const WindowButtons(),
        ]),
      ),
      pane: NavigationPane(
        selected: index,
        onChanged: (i) {
          setState(() => index = i);
        },
        header: SizedBox(
          height: kOneLineTileHeight,
          child: ShaderMask(
            shaderCallback: (rect) {
              final color = appTheme.color.resolveFromReverseBrightness(
                theme.brightness,
                level: theme.brightness == Brightness.light ? 0 : 2,
              );
              return LinearGradient(
                colors: [
                  color,
                  color,
                ],
              ).createShader(rect);
            },
            child: const FlutterLogo(
              style: FlutterLogoStyle.horizontal,
              size: 80.0,
              textColor: Colors.white,
              duration: Duration.zero,
            ),
          ),
        ),
        displayMode: appTheme.displayMode,
        indicator: () {
          switch (appTheme.indicator) {
            case NavigationIndicators.end:
              return const EndNavigationIndicator();
            case NavigationIndicators.sticky:
            default:
              return const StickyNavigationIndicator();
          }
        }(),
        items: originalItems,
        autoSuggestBox: AutoSuggestBox(
          key: searchKey,
          focusNode: searchFocusNode,
          controller: searchController,
          items: originalItems.whereType<PaneItem>().map((item) {
            assert(item.title is Text);
            final text = (item.title as Text).data!;

            return AutoSuggestBoxItem(
              label: text,
              value: text,
              onSelected: () async {
                final itemIndex = NavigationPane(
                  items: originalItems,
                ).effectiveIndexOf(item);

                setState(() => index = itemIndex);
                await Future.delayed(const Duration(milliseconds: 17));
                searchController.clear();
              },
            );
          }).toList(),
          placeholder: 'Search',
        ),
        autoSuggestBoxReplacement: const Icon(FluentIcons.search),
        footerItems: footerItems,
      ),
      onOpenSearch: () {
        searchFocusNode.requestFocus();
      },
    );
  }

  @override
  void onWindowClose() async {
    bool _isPreventClose = await windowManager.isPreventClose();
    if (_isPreventClose) {
      showDialog(
        context: context,
        builder: (_) {
          return ContentDialog(
            title: const Text('Confirm close'),
            content: const Text('Are you sure you want to close this window?'),
            actions: [
              FilledButton(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.pop(context);
                  windowManager.destroy();
                },
              ),
              Button(
                child: const Text('No'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = FluentTheme.of(context);

    return SizedBox(
      width: 138,
      height: 50,
      child: WindowCaption(
        brightness: theme.brightness,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

class _LinkPaneItemAction extends PaneItem {
  _LinkPaneItemAction({
    required super.icon,
    required this.link,
    required super.body,
    super.title,
  });

  final String link;

  @override
  Widget build(
      BuildContext context,
      bool selected,
      VoidCallback? onPressed, {
        PaneDisplayMode? displayMode,
        bool showTextOnTop = true,
        bool? autofocus,
        int? itemIndex,
      }) {
    return Link(
      uri: Uri.parse(link),
      builder: (context, followLink) => super.build(
        context,
        selected,
        followLink,
        displayMode: displayMode,
        showTextOnTop: showTextOnTop,
        itemIndex: itemIndex,
        autofocus: autofocus,
      ),
    );
  }
}