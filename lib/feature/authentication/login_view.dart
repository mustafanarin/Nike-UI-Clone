import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';
import 'package:nike_ui_clone/product/extensions/context_extension.dart';
import 'package:nike_ui_clone/product/widgets/project_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 75,
            ),
            Center(
              child: Text(
                "Hello Again!",
                style: context.textTheme().titleLarge,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Fill your details or continue with \nsocial media",
                  style: context.textTheme().titleSmall?.copyWith(
                        color: ProjectColors.auroMetal,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Email Address",
              style: context.textTheme().titleMedium,
            ),
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  filled: true,
                  fillColor: ProjectColors.cultured,
                  hintText: "xyz@gmail.com",
                  hintStyle: context.textTheme().bodyLarge?.copyWith(
                        color: ProjectColors.dimGray,
                      )),
            ),
            SizedBox(height: 30.h),
            Text(
              "Password",
              style: context.textTheme().titleMedium,
            ),
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                filled: true,
                fillColor: ProjectColors.cultured,
                hintText: "xyz@gmail.com",
                hintStyle: context.textTheme().bodyLarge?.copyWith(
                      color: ProjectColors.dimGray,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Recovery Password",
                    style: context.textTheme().bodyMedium,
                  ),
                ],
              ),
            ),
            ProjectButton(title: "Sign In", onPressed: () {}),
            SizedBox(
              height: 25.h,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: ProjectColors.cultured),
                icon: Image.asset("assets/png/general/googleIcon.png"),
                onPressed: () {},
                label: const Text("google")),
            const Spacer(
              flex: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New User?",
                  style: context.textTheme().titleSmall,
                ),
                Text(
                  "Create Account",
                  style: context.textTheme().titleSmall,
                )
              ],
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
