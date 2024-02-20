import 'package:flutter/material.dart';
import 'package:flutter_project_school/models/mode_place.dart';
import 'package:flutter_project_school/services/service_home.dart';
import 'package:flutter_project_school/utils/gen/gen_export.dart';
import 'package:flutter_project_school/utils/widgets/widget_animation_click.dart';
import 'package:flutter_project_school/utils/widgets/widget_container_gradient.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> listCategories = [
    {
      'title': 'Hotels',
      'icon': Assets.images.icoHotel.image(width: 24, height: 24),
      'color': Colors.orange.withOpacity(.2),
    },
    {
      'title': 'Flights',
      'icon': Assets.images.icoPlane.image(width: 24, height: 24),
      'color': Colors.red.withOpacity(.2),
    },
    {
      'title': 'All',
      'icon': Assets.images.icoHotelPlane.image(width: 24, height: 24),
      'color': Colors.green.withOpacity(.2),
    },
  ];

  List<ModelPlace> listPlace = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      try {
        listPlace = await ServiceHome.instant.getAllPlace();
      } catch (e) {
        listPlace = [];
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetContainerGradient(
              width: size.width,
              height: 180,
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(60)),
              colors: [
                ColorName.primary.withOpacity(.65),
                ColorName.primary,
              ],
              child: Stack(
                children: [
                  Positioned(
                      left: 24,
                      top: 24,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi Guy!",
                            style: StyleFont.bold(24).copyWith(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            "Where are you going next?",
                            style: StyleFont.regular().copyWith(color: Colors.white),
                          ),
                        ],
                      )),
                  Align(
                    alignment: const Alignment(0.0, 1.2),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              maxLines: 1,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search your text",
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(vertical: 8)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: List.generate(
                    listCategories.length,
                    (index) => Expanded(
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                                width: size.width,
                                margin: const EdgeInsets.symmetric(horizontal: 8).copyWith(bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: listCategories[index]['color'],
                                ),
                                child: listCategories[index]['icon'],
                              ),
                              Text(
                                listCategories[index]['title'],
                                style: StyleFont.regular(),
                              )
                            ],
                          ),
                        )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 24, bottom: 10),
              child: Text(
                "Popular Destinations",
                style: StyleFont.bold(),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(bottom: 16),
              child: Column(
                children: buildBodyWrap(
                  data: listPlace,
                  context: context,
                  countRow: 2,
                  buildItem: (int index) {
                    const double height = 180;

                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: size.width,
                            height: height,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.green),
                            child: Image.network(listPlace[index].image ?? '', width: size.width, height: height, fit: BoxFit.cover),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: Colors.black.withOpacity(.1),
                            width: size.width,
                            height: height,
                          ),
                        ),
                        Positioned(
                            right: 0,
                            top: 0,
                            child: WidgetAnimationClick(
                              onTap: () {
                                listPlace[index].favorite = !listPlace[index].favorite!;
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Icon(
                                  Icons.favorite,
                                  color: listPlace[index].favorite == true ? Colors.red : Colors.grey,
                                ),
                              ),
                            )),
                        Positioned(
                            bottom: 16,
                            left: 16,
                            right: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  listPlace[index].title ?? 'none',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: StyleFont.medium().copyWith(color: Colors.white),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.grey.withOpacity(.7)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "${listPlace[index].rate ?? 0.0}",
                                        style: StyleFont.regular(),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ))
                      ],
                    );
                  },
                ),
              ),
            ))
          ],
        )),
      ),
    );
  }

  List<Widget> buildBodyWrap<T>({
    required BuildContext context,
    required int countRow,
    bool lastItem = true,
    int index = 0,
    required List<T>? data,
    List<Widget>? listChild,
    double vertical = 10,
    double horizontal = 10,
    Function(BuildContext context)? buildLoading,
    required Function(int index) buildItem,
  }) {
    listChild ??= [];
    List<Widget> listChildRow = [];

    if (data != null) {
      for (int i = index; i < index + countRow; i++) {
        if (i < data.length) {
          listChildRow.add(
            Expanded(child: buildItem.call(i)),
          );
          // if (i < (data.length - 1) && (i < (index + countRow - 1))) {
          if (i < (index + countRow - 1)) {
            listChildRow.add(SizedBox(
              width: horizontal,
            ));
          }
        } else {
          listChildRow.add(const Expanded(child: SizedBox()));
        }
      }
    }

    listChild.add(Padding(
      padding: EdgeInsets.symmetric(vertical: vertical / 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: listChildRow,
      ),
    ));

    if ((index + countRow) < (data?.length ?? 0)) {
      buildBodyWrap(
          index: index + countRow, data: data, listChild: listChild, buildItem: buildItem, context: context, countRow: countRow, lastItem: lastItem);
    } else {
      if (lastItem == false) {
        listChild.add(buildLoading?.call(context) ?? const SizedBox());
      } else {
        listChild.add(const SizedBox());
      }
    }

    return listChild;
  }
}
