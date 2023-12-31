// import 'package:calentre/app/events/presentation/widgets/events_empty_state.dart';
import 'package:calentre/features/events/presentation/widgets/confirm_payment.dart';
import 'package:calentre/features/events/presentation/widgets/events_list.dart';
import 'package:flutter/material.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ConfirmPaymentView(),
        EventsList(),
      ],
    );
    // return eventsEmptyState(context);
  }
}
