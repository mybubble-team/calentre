import 'package:calentre/features/events/presentation/bloc/event_type_drop_down_bloc.dart';
import 'package:calentre/features/events/presentation/widgets/duration_drop_down.dart';
import 'package:calentre/features/events/presentation/widgets/event_type_drop_down.dart';
import 'package:calentre/features/events/presentation/widgets/multi_booking_drop_down.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/routes/routes.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/button.dart';
import 'package:calentre/shared/form_drop_down/bloc/form_drop_down_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'platform_drop_down.dart';

class CreateEventFormFields extends StatefulWidget {
  const CreateEventFormFields({super.key});

  @override
  State<CreateEventFormFields> createState() => _CreateEventFormFieldsState();
}

class _CreateEventFormFieldsState extends State<CreateEventFormFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Event Name",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  const SizedBox().y10(),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter Event Name",
                      filled: true,
                    ),
                    cursorColor: AppColors.foundation.white,
                  ),
                ],
              ),
              const SizedBox().y20(),
              const SizedBox().y10(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description (Optional)",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.w100),
                  ),
                  const SizedBox().y10(),
                  TextFormField(
                    maxLines: 5,
                    decoration: const InputDecoration(
                      hintText: "What's your event about?",
                      filled: true,
                    ),
                    cursorColor: AppColors.foundation.white,
                  ),
                ],
              ),
              const SizedBox().y20(),
              const SizedBox().y10(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Platform",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(fontWeight: FontWeight.w100),
                          ),
                          const SizedBox().y10(),
                          const PlatformDropDown()
                        ],
                      ),
                    ),
                  ),
                  const SizedBox().x10(),
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Duration",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(fontWeight: FontWeight.w100),
                          ),
                          const SizedBox().y10(),
                          const DurationDropDown()
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox().y20(),
              const SizedBox().y10(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Meeting Link",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  const SizedBox().y10(),
                  TextFormField(
                    initialValue: "https://calentre.com/LilYatchy",
                    readOnly: true,
                    decoration: const InputDecoration(
                      filled: true,
                    ),
                    cursorColor: AppColors.foundation.white,
                  ),
                ],
              ),
              const SizedBox().y20(),
              const SizedBox().y10(),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Event Type",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.w100),
                  ),
                  const SizedBox().y10(),
                  const EventTypeDropDown()
                ],
              ),
              BlocBuilder<EventTypeDropDownBloc, FormDropDownState>(
                  builder: (context, state) {
                debugPrint("Event type rebuild");
                debugPrint('$state');
                var bloc = (BlocProvider.of<EventTypeDropDownBloc>(
                  context,
                ));
                if (state is FormDropDownInitialState ||
                    bloc.dropDownValue == "Free") {
                  return Container();
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox().y20(),
                      const SizedBox().y10(),
                      Text(
                        "Amount",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                      const SizedBox().y10(),
                      TextFormField(
                        initialValue: "\$5",
                        decoration: const InputDecoration(
                          filled: true,
                        ),
                        cursorColor: AppColors.foundation.white,
                      ),
                    ],
                  );
                }
              }),
              const SizedBox().y20(),
              const SizedBox().y10(),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Allow Mutiple Time Slot booking?",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.w100),
                  ),
                  const SizedBox().y10(),
                  const MultiBookingDropDown()
                ],
              ),
            ],
          ),
        ),
        const SizedBox().y20(),
        const SizedBox().y10(),
        AppButton(
            title: "Set Availability",
            gradient: true,
            onPressed: () {
              context.pushNamed(AppRoutes.setAvailabilityView);
            })
      ],
    );
  }
}
