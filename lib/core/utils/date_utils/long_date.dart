import 'package:court_click/core/constants/moths.dart';

String longDate(String? iso) {
  final d = DateTime.tryParse(iso ?? '');
  if (d == null) return 'soon';
  return '${months[d.month - 1]} ${d.day}';
}