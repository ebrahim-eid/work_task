import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controller/app_cubit.dart';
import '../controller/app_states.dart';
import '../core/componants.dart';

class BuildSlidingView extends StatelessWidget {
  const BuildSlidingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                AnimatedOpacity(
                  opacity: AppCubit.get(context).current == 0 ? 1 : 0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.linear,
                  child: SizedBox(
                    height: 200,
                    child: caroselView(context,
                        image:
                            'assets/images/01 Engineers Team Discussing Blueprint.png',
                        contentText: 'Management platform\nreal estate asset',
                        buttonText: 'Request',
                        space: 18,
                        greyText:
                            'Utilizing a variety of properties oversight an construction'),
                  ),
                ),
                AnimatedOpacity(
                    opacity: AppCubit.get(context).current == 1 ? 1 : 0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.linear,

                    child: SizedBox(
                      height: 200,
                      child: caroselView(
                        context,
                        image:
                            'assets/images/02 Man Presentation Miniature Building.png',
                        contentText:
                            'Multi-Services for Your Real Estate Needs',
                        buttonText: 'Order',
                        space: 16,
                      ),
                    )),
                AnimatedOpacity(
                    opacity: AppCubit.get(context).current == 2 ? 1 : 0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.linear,

                    child: SizedBox(
                      height: 200,
                      child: caroselView(
                        context,
                        image:
                            'assets/images/04 Male Architect-Engineer Presents Project of New Building.png',
                        contentText:
                            'Leasing, Maintenance and Managing Your Properties with Ease',
                        buttonText: 'My Assets',
                        space: 16,
                      ),
                    )),
              ],
            ),
const SizedBox(height: 4,),
            //Here I used carouselSlider as I want autoPlay to change indicator activeIndex for the widgets
            // and put empty sizedBox without height or width on its item

            CarouselSlider(
                items: const [SizedBox(width: 0,height: 0,), SizedBox(width: 0,height: 0,), SizedBox(width: 0,height: 0,)],
                options: CarouselOptions(
                  autoPlay: true,
                  height: 0,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  autoPlayCurve: Curves.linear,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    AppCubit.get(context).changeCarousalView(index);
                  },
                )),
            AnimatedSmoothIndicator(
              activeIndex: AppCubit.get(context).current,
              count: 3,
              effect: const ExpandingDotsEffect(
                  dotHeight: 8,
                  spacing: 8,
                  dotWidth: 8,
                  offset: 18,
                  expansionFactor: 4,
                  strokeWidth: 5,
                  activeDotColor: Colors.red,
                  dotColor: Colors.grey),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        );
      },
    );
  }
}
