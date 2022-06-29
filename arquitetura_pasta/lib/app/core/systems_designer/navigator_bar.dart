import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:sizer/sizer.dart';

import '../../../styles/styles.dart';
import '../global/controllers/controller_widget_bottom_navigation_bar.dart';

class NavigatorBar extends GetView<WidgetBottomNavigationBarController> {
  const NavigatorBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(onTap: () {
              Get.offAllNamed("/Home");
            }, child: Obx(() {
              return TweenAnimationBuilder(
                curve: Curves.elasticInOut,
                duration: const Duration(milliseconds: 200),
                tween: controller.iconHome.value == true
                    ? Tween<double>(begin: 0, end: 1.1)
                    : Tween<double>(begin: 1, end: 1),
                builder: (BuildContext context, double value, Widget? child) {
                  return Transform.scale(
                    child: child,
                    scale: value,
                  );
                },
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() {
                        return const Icon(
                          Icons.abc_rounded,
                          color: Colors.grey,
                          size: 18,
                        );
                      }),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(() {
                        return Text(
                          " Início",
                          style: titleStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              size: 9.sp),
                        );
                      })
                    ],
                  ),
                ),
              );
            })),
            GestureDetector(onTap: () {
              Get.offAllNamed("/Recados");
            }, child: Obx(() {
              return TweenAnimationBuilder(
                  curve: Curves.elasticInOut,
                  duration: const Duration(milliseconds: 200),
                  tween: controller.iconRecados.value == true
                      ? Tween<double>(begin: 0, end: 1.1)
                      : Tween<double>(begin: 1, end: 1),
                  builder: (BuildContext context, double value, Widget? child) {
                    return Transform.scale(
                      child: child,
                      scale: value,
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(() {
                          return const Icon(
                            Icons.abc_rounded,
                            color: Colors.grey,
                            size: 18,
                          );
                        }),
                        const SizedBox(
                          height: 5,
                        ),
                        Obx(() {
                          return Text(
                            " Recados",
                            style: titleStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                size: 9.sp),
                          );
                        })
                      ],
                    ),
                  ));
            })),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Obx(() {
                  return const Icon(
                    Icons.abc_rounded,
                    color: Colors.grey,
                    size: 18,
                  );
                }),
                const SizedBox(
                  height: 5,
                ),
                Obx(() {
                  return Text(
                    " Financeiro",
                    style: titleStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        size: 9.sp),
                  );
                })
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Obx(() {
                  return const Icon(
                    Icons.abc_rounded,
                    color: Colors.grey,
                    size: 18,
                  );
                }),
                const SizedBox(
                  height: 5,
                ),
                Obx(() {
                  return Text(
                    "  Fotos",
                    style: titleStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        size: 9.sp),
                  );
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
