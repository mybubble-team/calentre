import 'package:calentre/app/create_events/presentation/widget/form_fields.dart';
import 'package:calentre/config/constraints/constraints.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/button.dart';
import 'package:calentre/shared/navbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateEventView extends StatelessWidget {
  const CreateEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          // constraints: BoxConstraints(maxWidth: WebConstraints.maxWidth),
          child: Column(
            children: [
              const NavBar(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                width: WebConstraints.maxWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const FaIcon(FontAwesomeIcons.circleChevronLeft),
                        const SizedBox().x20(),
                        Text("Create Event",
                            style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    ),
                    AppButton(
                      title: "Create",
                      onPressed: () {},
                      gradient: true,
                      width: 100,
                    )
                  ],
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.grey.s700,
                        width: 1.0,
                      ),
                    ),
                  )),
              Container(
                  width: 700,
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: const CreateEventFormFields())
            ],
          ),
        ),
      ),
    );
  }
}
