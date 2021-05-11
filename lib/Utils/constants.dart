/// Created by Usman Akhlaq on 29.03.2021
/// Copyright © 2021 Syed Usman All rights reserved.
/// Email: uakhlaq88@gmail.com

const List<String> kMonths = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];

const List<String> kWeekdaysShort = [
  "Mon",
  "Tue",
  "Wed",
  "Thu",
  "Fri",
  "Sat",
  "Sun",
];

const List<String> subjectName = [
  'Maths',
  'English',
  'Urdu',
  'Physics',
];

const List<String> leaveType = [
  'Select Leave Type',
  'Sick Leave',
  'Casual Leave'
];

List<int> kYears = [for (var i = 2000; i < DateTime.now().year + 1; i += 1) i];
