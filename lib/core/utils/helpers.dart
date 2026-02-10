
String formatDateTime(String dateTime) {
  final dt = DateTime.parse(dateTime);
  return '${_days[dt.weekday - 1]}, ${dt.day} ${_months[dt.month - 1]}';
}

const List<String> _days = [
  'Sat',
  'Sun'
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',

];
const List<String> _months = [
  'Jan', 'Feb', 'Mar',
  'Apr', 'May', 'Jun',
  'Jul', 'Aug', 'Sep',
  'Oct', 'Nov', 'Dec'
];
String dayNameFromDate(DateTime date) {
  const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  return days[date.weekday % 7];
}