import 'package:caremint/ui/components/custom_button.dart';
import 'package:caremint/ui/components/intro_slider_componenets.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SliderPage1 extends StatelessWidget {
  const SliderPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image
            Intro("assets/images/blog1.png").sliderImage(context),
//Heading
            Intro("Select Car Wash Services, Data, Time and Location and we will be at your Doorstep")
                .textHeading(context),
//Lable
            // groceree gives you fresh vegetables and fruits
            Intro("Select Car Wash Services, Data, Time and Location and we will be at your Doorstep")
                .textPara(context),
            const SizedBox(height: 30),
//Butoon
            // const Spacer(),

            // get started button
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SliderPage2();
                  },
                ),
              ),
              child: CustomButton().customButton200( context, "Next"),
            ),

            // const Spacer(),
          ],
        ),
      ),
    );
  }
}

class SliderPage2 extends StatelessWidget {
  const SliderPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image
              Intro("assets/images/service3.png").sliderImage(context),
              Intro("Find the best dry wash car service at your doorstep")
                  .textHeading(context),
              Intro("Meet the nearest car wash center at your preferred time")
                  .textPara(context),
              const SizedBox(height: 30),
//Butoon
              // const Spacer(),

              // get started button
              GestureDetector(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SliderPage3();
                    },
                  ),
                ),
                child: CustomButton().customButton200(context, "Next"),

              ),

              // const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class SliderPage3 extends StatelessWidget {
  const SliderPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Image
                Intro("assets/images/slider2.png").sliderImage(context),
                //Heading
                Intro("Enjoy our service at your Doorstep").textHeading(context),
                Intro("Enjoy a high quality dry car wash at your doorstep")
                    .textPara(context),
                const SizedBox(height: 30),
                    //Butoon
                // get started button
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(

                      builder: (context) {
                        return HomePage();
                      },
                    ),
                  ),
                  child: CustomButton().customButton200(context, "Get Started"),

                  // child: Intro("Get Started").buildButton(context),
                ),

                // const Spacer(),
              ],
            ),
          ),
        ),

    );
  }
}
