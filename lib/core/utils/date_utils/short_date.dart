

import 'package:court_click/core/constants/moths.dart';

String shortDate(String? iso) {
  final d = DateTime.tryParse(iso ?? '');
  if (d == null) return 'TBA';
  return '${months[d.month - 1].substring(0, 3)} ${d.day}';
}


