import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:flutter/material.dart' hide DateRangePickerDialog;
import 'package:wms/src/core/utils/extensions/date.dart';
import 'package:wms/src/core/utils/extensions/extensions.dart';

//TODO translate
class CustomRangeDatePicker extends StatelessWidget {
  final DateRange? selected;
  final ValueChanged<DateRange?> onResult;

  const CustomRangeDatePicker(
      {super.key, required this.onResult, this.selected});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
        label: selected == null
            ? const Text("Select Date")
            : Text(
                "From ${selected!.start.format()} to  ${selected!.end.format()}"),
        onPressed: () async {
          final res = await showGeneralDialog<DateRange>(
            context: context,
            barrierLabel: 'DateRangePickerDialogBarrier',
            barrierDismissible: true,
            pageBuilder: (_, __, ___) {
              return Center(
                child: DateRangePickerDialog(
                  builder: datePickerBuilder,
                  footerBuilder: DateRangePickerDialogFooter.new,
                ),
              );
            },
          );
          onResult(res);
        },
        icon: const Icon(Icons.date_range));
  }

  Widget datePickerBuilder(
      BuildContext context, void Function(DateRange?) onDateRangeChanged,
      [bool doubleMonth = true]) {
    final now = DateTime.now();
    final lastMonth = now.copyWith(month: now.month - 1);
    return DateRangePickerWidget(
      height: 400,
      doubleMonth: context.screenSize.width > 850,
      quickDateRanges: context.screenSize.width < 600
          ? []
          : [
              QuickDateRange(dateRange: null, label: "Remove date range"),
              QuickDateRange(
                label: 'Last 7 days',
                dateRange: DateRange(
                  now.subtract(const Duration(days: 7)),
                  now,
                ),
              ),
              QuickDateRange(
                label: 'Last 30 days',
                dateRange: DateRange(
                  now.subtract(const Duration(days: 30)),
                  now,
                ),
              ),
              QuickDateRange(
                label: 'Current Month',
                dateRange: DateRange(
                  now.startOfMonth(),
                  now.endOfMonth(),
                ),
              ),
              QuickDateRange(
                label: 'Last Month',
                dateRange: DateRange(
                  lastMonth.startOfMonth(),
                  lastMonth.endOfMonth(),
                ),
              ),
            ],
      onDateRangeChanged: onDateRangeChanged,
    );
  }
}
