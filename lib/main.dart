import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constracts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins', // This specifies the default font family
      ),
      home: const HomeMain(),
    );
  }
}

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  late PageController pageController;
  var currentPage=0;
  bool isCardVisible = false;
  @override
  void initState() {
    pageController=PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Logo',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Home',
                        style: styleText,
                      ),
                      Text(
                        'About',
                        style: styleText,
                      ),
                      Text(
                        'Services',
                        style: styleText,
                      ),
                      Text(
                        'Contact',
                        style: styleText,
                      ),
                      TextButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 26),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.white.withOpacity(0.9)))),
                        onPressed: () {
                          setState(() {
                            isCardVisible = true;
                          });
                        },
                        child: Text(
                          'Login',
                          style: styleText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: isCardVisible ? 1 : 0),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child:buildSizedBoxCard(),
                );
              },
            ),

          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBoxCard() {
    return SizedBox(
      height: 600,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300), // Animation duration
                  curve: Curves.easeInOut, // Animation curve
                  width: 370,
                  height: currentPage == 0 ? 380 : 450,
                  child: Card(
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.white60.withOpacity(0.7),
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: PageView(
                        controller: pageController,
                        onPageChanged: (val){

                          setState(() {
                            currentPage=val;
                          });
                        },
                        children: [
                          buildColumnLogin(),
                          buildColumnRegister(),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isCardVisible = false;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    child: const Icon(
                      CupertinoIcons.clear,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row buildRow() {
    return Row(
      children: [
        const Expanded(
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Logo',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Home',
                style: styleText,
              ),
              Text(
                'About',
                style: styleText,
              ),
              Text(
                'Services',
                style: styleText,
              ),
              Text(
                'Contact',
                style: styleText,
              ),
              TextButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 26),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.white.withOpacity(0.9)))),
                  onPressed: () {},
                  child: Text(
                    'Login',
                    style: styleText,
                  ))
            ],
          ),
        ),
      ],
    );
  }

  Column buildColumnLogin() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Login',
          style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        TextFormField(
          decoration: const InputDecoration(
              hintText: 'Email',
              enabledBorder: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder(),
              suffixIcon: Icon(
                Icons.email,
                color: Colors.black,
                size: 18,
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: const InputDecoration(
              hintText: 'Password',
              enabledBorder: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder(),
              suffixIcon: Icon(
                Icons.lock,
                color: Colors.black,
                size: 18,
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Transform.scale(
              scale: 0.8, // Adjust this value to resize the Checkbox
              child: Checkbox(
                value: true,
                onChanged: (bool? value) {},
              ),
            ),

            const Text('Remember Me',style: TextStyle(fontSize: 15),),
            const Spacer(),
            const Text('Forget Password?',style: TextStyle(fontSize: 15),),

          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(

            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: const Size(double.infinity,50),
              maximumSize: const Size(double.infinity,50),
            ),
            onPressed: (){}, child: Text('Login',style: styleText,)),
        const SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account?"),
            GestureDetector(
              onTap: (){
                setState(() {

                  pageController.animateToPage(1,duration: const Duration(milliseconds: 500), curve: Curves.linear);
                });
              },
              child: const Text("Register",style: TextStyle(

                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
            ),
          ],
        )
      ],
    );
  }

  Column buildColumnRegister() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Regegister',
          style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        TextFormField(
          decoration: const InputDecoration(
              hintText: 'Username',
              enabledBorder: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder(),
              suffixIcon: Icon(
                Icons.person,
                color: Colors.black,
                size: 18,
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: const InputDecoration(
              hintText: 'Email',
              enabledBorder: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder(),
              suffixIcon: Icon(
                Icons.email,
                color: Colors.black,
                size: 18,
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: const InputDecoration(
              hintText: 'Password',
              enabledBorder: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder(),
              suffixIcon: Icon(
                Icons.lock,
                color: Colors.black,
                size: 18,
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Transform.scale(
              scale: 0.8, // Adjust this value to resize the Checkbox
              child: Checkbox(
                value: true,
                onChanged: (bool? value) {},
              ),
            ),

            const Text('I agree to the terms & conditions',style: TextStyle(fontSize: 15),),


          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(

            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: const Size(double.infinity,50),
              maximumSize: const Size(double.infinity,50),
            ),
            onPressed: (){}, child: Text('Register',style: styleText,)),
        const SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account?"),
            GestureDetector(
              onTap: (){
                setState(() {

                  pageController.animateToPage(0,duration: const Duration(milliseconds: 500), curve: Curves.linear);
                });
              },
              child: const Text("Login",style: TextStyle(

                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
            ),
          ],
        )
      ],
    );
  }
}
