import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import './../../config/config.dart';

Widget buildLogo(BuildContext context, double logoHeight) => Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          if (AppEnv.hasLogo)
            SvgPicture.asset(
              'assets/images/logo.svg',
              key: const ValueKey("siteLogo"),
              fit: BoxFit.fill,
              height: logoHeight,
            ),
          if (!AppEnv.hasLogo)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100.0),
                RichText(
                  key: const ValueKey("siteName"),
                  text: TextSpan(
                    text: AppEnv.app,
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                    children: [
                      TextSpan(
                        text: ' ${AppEnv.name}',
                        style: TextStyle(
                          color: Palette.primaryColour,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          Text(
            AppEnv.description,
            key: const ValueKey("siteDescription"),
          )
        ],
      ),
    );
