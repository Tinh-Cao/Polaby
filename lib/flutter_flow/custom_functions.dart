import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/custom_auth/auth_util.dart';

List<int> hours() {
  List<int> hourList = [];
  for (int i = 0; i <= 23; i++) {
    hourList.add(i);
  }
  return hourList;
}

List<int> minutes() {
  List<int> minuteList = [];
  for (int i = 0; i <= 59; i++) {
    minuteList.add(i);
  }

  return minuteList;
}

DateTime? dateTimeParse(String? dateString) {
  if (dateString == null || dateString.isEmpty) {
    return null;
  }

  try {
    // Use DateTime.parse to automatically parse the ISO 8601 string
    final DateTime dateTime = DateTime.parse(dateString);

    // Return the DateTime object
    return dateTime;
  } catch (e) {
    // Return null or handle the error as needed
    return null;
  }
}

bool checkExpiredTime(DateTime expirationTime) {
  DateTime now = DateTime.now();

  if (now.isAfter(expirationTime)) {
    return false;
  } else {
    return true;
  }
}

String? caculatePregnantWeek(DateTime? firstDayOfPeriod) {
  if (firstDayOfPeriod == null) {
    return 'Invalid Date';
  }

  try {
    // Ngày hiện tại
    final DateTime currentDate = DateTime.now();

    // Tính số ngày giữa ngày đầu tiên của chu kỳ và ngày hiện tại
    final int daysDifference = currentDate.difference(firstDayOfPeriod).inDays;

    // Tính số tuần và số ngày
    final int weeks = daysDifference ~/ 7;
    final int days = daysDifference % 7;

    // Trả về số tuần và số ngày dưới dạng chuỗi
    return '${weeks} tuần ${days} ngày';
  } catch (e) {
    // Xử lý lỗi nếu có
    return 'Error: $e';
  }
}

DateTime? calculateDueDate(DateTime? firstDayOfPeriod) {
  try {
    DateTime today = DateTime.now();

    if (firstDayOfPeriod != null) {
      // Tính ngày dự sinh dựa trên ngày đầu tiên của chu kỳ
      return firstDayOfPeriod.add(Duration(days: 280));
    } else {
      return null; // Không đủ thông tin để tính toán
    }
  } catch (e) {
    // Xử lý lỗi nếu có
    return null;
  }
}

String? caculatePregnantWeekV4(
  int day,
  int month,
  int year,
  int dayV1,
  int monthV1,
  int yearV1,
) {
  try {
    // Ngày hiện tại (nhập vào)
    DateTime inputDate = DateTime(year, month, day);

    // Ngày dự sinh
    DateTime dueDate = DateTime(yearV1, monthV1, dayV1);

    // Tính toán ngày thụ thai dựa trên ngày dự sinh (280 ngày trước ngày dự sinh)
    DateTime conceptionDate = dueDate.subtract(Duration(days: 280));

    // Tính toán số ngày mang thai từ ngày bắt đầu mang thai (conceptionDate) đến ngày nhập liệu (inputDate)
    int daysPregnant = inputDate.difference(conceptionDate).inDays;

    // Chia thành tuần và ngày
    int weeks = daysPregnant ~/ 7;
    int days = daysPregnant % 7;

    // Trả về số tuần và ngày so với ngày thụ thai
    return '$weeks tuần $days ngày';
  } catch (e) {
    // Xử lý lỗi nếu có
    return 'Error: $e';
  }
}

String? caculatePregnantWeekV3(
  int day,
  int month,
  int year,
) {
  try {
    DateTime currentDate = DateTime.now();
    DateTime startDate = DateTime(year, month, day);

    // Nếu ngày nhập vào cách thời gian hiện tại quá 280 ngày trước hoặc sau thời gian hiện tại 1 ngày
    if (startDate.isBefore(currentDate.subtract(Duration(days: 280))) ||
        startDate.isAfter(currentDate.add(Duration(days: 1)))) {
      startDate = currentDate;
    }

    // Tính số ngày đã mang thai
    int daysPregnant = currentDate.difference(startDate).inDays;

    // Tính số tuần và số ngày từ ngày đã mang thai
    int weeks = daysPregnant ~/ 7;
    int days = daysPregnant % 7;

    // Trả về số tuần và số ngày đã mang thai
    return '$weeks tuần $days ngày';
  } catch (e) {
    // Xử lý lỗi nếu có
    return 'Error: $e';
  }
}

String calculateWeeksAndDaysRemaining(DateTime? dueDate) {
  if (dueDate == null) {
    return 'Ngày dự sinh không hợp lệ'; // Hoặc có thể ném lỗi tùy thuộc vào yêu cầu
  }

  final DateTime now = DateTime.now();
  final Duration difference = dueDate.difference(now);

  // Số ngày còn lại
  final int remainingDays = difference.inDays;

  // Tính số tuần và số ngày còn lại
  final int weeks = remainingDays ~/ 7;
  final int days = remainingDays % 7;

  // Định dạng kết quả
  return '$weeks tuần $days ngày';
}

DateTime? calculateDueDateFromCurrentWeeks(
  int weeks,
  int days,
) {
  DateTime today = DateTime.now();
  int totalWeeks = 40; // Tổng số tuần thai kỳ
  int daysPerWeek = 7;

  // Kiểm tra tính hợp lệ của đầu vào
  if (weeks < 0 || weeks > totalWeeks || days < 0 || days >= daysPerWeek) {
    return null; // Số tuần hoặc ngày không hợp lệ
  }

  // Tính tổng số ngày hiện tại
  int totalDaysCurrent = weeks * daysPerWeek + days;

  // Tính ngày dự sinh từ số tuần mang thai hiện tại
  DateTime dueDate =
      today.add(Duration(days: (totalWeeks * daysPerWeek - totalDaysCurrent)));

  return dueDate;
}

String? caculateWeeksAndDaysRe(
  int weeks,
  int days,
) {
  // Tổng số tuần thai kỳ
  const int totalWeeks = 40;
  const int daysPerWeek = 7;

  // Kiểm tra tính hợp lệ của đầu vào
  if (weeks < 0 || weeks >= totalWeeks || days < 0 || days >= daysPerWeek) {
    return 'Số tuần hoặc ngày không hợp lệ'; // Đầu vào không hợp lệ
  }

  // Tổng số tuần và ngày hiện tại
  int totalDaysCurrent = weeks * daysPerWeek + days;

  // Tính số tuần và ngày còn lại
  int totalDaysRemaining = (totalWeeks * daysPerWeek) - totalDaysCurrent;
  int remainingWeeks = totalDaysRemaining ~/ daysPerWeek;
  int remainingDays = totalDaysRemaining % daysPerWeek;

  return '$remainingWeeks tuần $remainingDays ngày';
}

DateTime? caculatePregnantDay(
  int weeks,
  int days,
) {
  DateTime today = DateTime.now();
  int daysPerWeek = 7; // Số ngày trong một tuần

  // Kiểm tra tính hợp lệ của đầu vào
  if (weeks < 0 || days < 0 || days >= daysPerWeek) {
    return null; // Số tuần hoặc ngày không hợp lệ
  }

  // Tính tổng số ngày mang thai hiện tại
  int totalDaysPregnant = weeks * daysPerWeek + days;

  // Tính ngày bắt đầu của thai kỳ bằng cách trừ số ngày mang thai hiện tại từ ngày hiện tại
  DateTime pregnancyStartDate =
      today.subtract(Duration(days: totalDaysPregnant));

  return pregnancyStartDate;
}

List<int>? weeks() {
  List<int> weekList = List.generate(41, (index) => index);

  return weekList;
}

List<int>? dayOfWeeks() {
  List<int> dayList = List.generate(7, (index) => index);

  return dayList;
}

String? changeFormatDatime(String? dateTimeStr) {
  if (dateTimeStr == null) return null;

  try {
    // Parse the string into a DateTime object
    final inputFormat = DateTime.parse(dateTimeStr);

    // Format the DateTime object to 'd/M/y'
    final outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(inputFormat);
  } catch (e) {
    // Return null if there is an error during parsing
    return null;
  }
}

String convertToApiDateFormatString(String dateString) {
  if (dateString != null || dateString.trim().isNotEmpty) {
    // Phân tích chuỗi ngày tháng với thời gian
    final inputFormat = DateTime.parse(dateString);

    // Format the DateTime object to 'd/M/y'
    final outputFormat = DateFormat('yyyy-MM-dd');
    return outputFormat.format(inputFormat);
  }

  return '';
}

String convertToApiDateFormatDate(DateTime dateTime) {
  if (dateTime != null) {
    // Chuyển đổi đối tượng DateTime sang định dạng yyyy-MM-dd
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
  return "";
}

List<int>? months() {
  List<int> monthList = [];
  for (int i = 1; i <= 12; i++) {
    monthList.add(i);
  }
  return monthList;
}

List<int>? dayOfMonths(
  int? month,
  int? year,
) {
  int currentYear = year ?? DateTime.now().year;
  int currentMonth = month ?? DateTime.now().month;
  int daysInMonth = DateTime(currentYear, currentMonth + 1, 0).day;
  List<int> daysList = List<int>.generate(daysInMonth, (index) => index + 1);

  return daysList;
}

List<int>? years() {
  List<int> yearList = [];
  for (int i = 2024; i <= 2100; i++) {
    yearList.add(i);
  }
  return yearList;
}

String? calculateWeeksAndDaysRemainingV2(
  int day,
  int month,
  int year,
) {
  // Ngày hiện tại
  final DateTime today = DateTime.now();

  // Ngày dự sinh
  final DateTime dueDate = DateTime(year, month, day);

  // Kiểm tra ngày dự sinh không hợp lệ
  if (dueDate.isBefore(today)) {
    return 'Ngày dự sinh không hợp lệ'; // Ngày dự sinh đã qua
  }

  // Tổng số tuần thai kỳ và số ngày mỗi tuần
  const int daysPerWeek = 7;

  // Tính số ngày giữa ngày hiện tại và ngày dự sinh
  final int daysRemaining = dueDate.difference(today).inDays;

  // Tính số tuần và ngày còn lại
  final int remainingWeeks = daysRemaining ~/ daysPerWeek;
  final int remainingDays = daysRemaining % daysPerWeek;

  return '$remainingWeeks tuần $remainingDays ngày';
}

int getCurrentYearIndex(List<int> years) {
  List<int>? yearList = years;
  int currentYear = DateTime.now().year;
  int yearIndex = yearList?.indexOf(currentYear) ?? 0;
  return yearIndex;
}

int getCurrentDayIndex(List<int>? days) {
  int currentDay = DateTime.now().day;
  int dayIndex = days?.indexOf(currentDay) ?? 0;
  return dayIndex;
}

int getCurrentMonthIndex(List<int>? months) {
  List<int>? monthList = months;
  int currentMonth = DateTime.now().month;
  int monthIndex = monthList?.indexOf(currentMonth) ?? 0;
  return monthIndex;
}

String? caculatePregnantWeekV2(
  int day,
  int month,
  int year,
) {
  try {
    DateTime currentDate = DateTime.now();
    DateTime dueDate = DateTime(year, month, day);
    DateTime conceptionDate = dueDate.subtract(Duration(days: 280));
    int daysPregnant = 0;
    if (dueDate.isBefore(currentDate.subtract(Duration(days: 1))) ||
        dueDate.isAfter(currentDate.add(Duration(days: 280)))) {
      conceptionDate = currentDate;
    }
    daysPregnant = currentDate.difference(conceptionDate).inDays;
    int weeks = daysPregnant ~/ 7;
    int days = daysPregnant % 7;

    // Trả về số tuần và số ngày mang thai
    return '$weeks tuần $days ngày';
  } catch (e) {
    // Xử lý lỗi nếu có
    return 'Error: $e';
  }
}

int getDayIndex(int day) {
  List<int> dayList = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31
  ];
  int dayIndex = dayList.indexOf(day + 1);
  return dayIndex;
}

int getMonthFromIndex(int index) {
  List<int> monthsList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  if (index >= 1 && index <= monthsList.length) {
    return monthsList[index - 1];
  }
  return 99;
}

List<String> generateFilterFoodGroupList() {
  return [
    "Tất cả",
    "Ngũ cốc và sản phẩm chế biến",
    "Khoai củ và sản phẩm chế biến",
    "Hạt, quả giàu đạm, chất béo và sản phẩm chế biến",
    "Rau, quả, củ dùng làm rau",
    "Quả chín",
    "Dầu, mỡ, bơ",
    "Thịt và sản phẩm chế biến",
    "Thủy sản và sản phẩm chế biến",
    "Trứng và sản phẩm chế biến",
    "Sữa và sản phẩm chế biến",
    "Đồ hộp",
    "Đồ ngọt (đường, bánh, mứt, kẹo)",
    "Gia vị, nước chấm",
    "Nước giải khát, bia, rượu",
    "Thức ăn truyền thống",
    "Một số thức ăn nhanh",
    "Thực phẩm thể thao",
    "Thực phẩm bệnh đái tháo đường",
    "Thực phẩm bệnh suy thận",
    "Thực phẩm bệnh ung thư",
    "Thực phẩm dinh dưỡng bổ sung"
  ];
}

int getMonthIndex(int month) {
  List<int> monthList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  int monthIndex = monthList.indexOf(month + 1);
  return monthIndex;
}

int getYearFromIndex(int index) {
  List<int> yearsList = [
    2024,
    2025,
    2026,
    2027,
    2028,
    2029,
    2030,
    2031,
    2032,
    2033,
    2034,
    2035,
    2036,
    2037,
    2038,
    2039,
    2040,
    2041,
    2042,
    2043,
    2044,
    2045,
    2046,
    2047,
    2048,
    2049,
    2050,
    2051,
    2052,
    2053,
    2054,
    2055,
    2056,
    2057,
    2058,
    2059,
    2060,
    2061,
    2062,
    2063,
    2064,
    2065,
    2066,
    2067,
    2068,
    2069,
    2070,
    2071,
    2072,
    2073,
    2074,
    2075,
    2076,
    2077,
    2078,
    2079,
    2080,
    2081,
    2082,
    2083,
    2084,
    2085,
    2086,
    2087,
    2088,
    2089,
    2090,
    2091,
    2092,
    2093,
    2094,
    2095,
    2096,
    2097,
    2098,
    2099,
    2100
  ];

  if (index >= 0 && index < yearsList.length) {
    return yearsList[index];
  }
  return 0;
}

int getYearIndex(int year) {
  List<int> yearList = [
    1800,
    1801,
    1802,
    1803,
    1804,
    1805,
    1806,
    1807,
    1808,
    1809,
    1810,
    1811,
    1812,
    1813,
    1814,
    1815,
    1816,
    1817,
    1818,
    1819,
    1820,
    1821,
    1822,
    1823,
    1824,
    1825,
    1826,
    1827,
    1828,
    1829,
    1830,
    1831,
    1832,
    1833,
    1834,
    1835,
    1836,
    1837,
    1838,
    1839,
    1840,
    1841,
    1842,
    1843,
    1844,
    1845,
    1846,
    1847,
    1848,
    1849,
    1850,
    1851,
    1852,
    1853,
    1854,
    1855,
    1856,
    1857,
    1858,
    1859,
    1860,
    1861,
    1862,
    1863,
    1864,
    1865,
    1866,
    1867,
    1868,
    1869,
    1870,
    1871,
    1872,
    1873,
    1874,
    1875,
    1876,
    1877,
    1878,
    1879,
    1880,
    1881,
    1882,
    1883,
    1884,
    1885,
    1886,
    1887,
    1888,
    1889,
    1890,
    1891,
    1892,
    1893,
    1894,
    1895,
    1896,
    1897,
    1898,
    1899,
    1900,
    1901,
    1902,
    1903,
    1904,
    1905,
    1906,
    1907,
    1908,
    1909,
    1910,
    1911,
    1912,
    1913,
    1914,
    1915,
    1916,
    1917,
    1918,
    1919,
    1920,
    1921,
    1922,
    1923,
    1924,
    1925,
    1926,
    1927,
    1928,
    1929,
    1930,
    1931,
    1932,
    1933,
    1934,
    1935,
    1936,
    1937,
    1938,
    1939,
    1940,
    1941,
    1942,
    1943,
    1944,
    1945,
    1946,
    1947,
    1948,
    1949,
    1950,
    1951,
    1952,
    1953,
    1954,
    1955,
    1956,
    1957,
    1958,
    1959,
    1960,
    1961,
    1962,
    1963,
    1964,
    1965,
    1966,
    1967,
    1968,
    1969,
    1970,
    1971,
    1972,
    1973,
    1974,
    1975,
    1976,
    1977,
    1978,
    1979,
    1980,
    1981,
    1982,
    1983,
    1984,
    1985,
    1986,
    1987,
    1988,
    1989,
    1990,
    1991,
    1992,
    1993,
    1994,
    1995,
    1996,
    1997,
    1998,
    1999,
    2000,
    2001,
    2002,
    2003,
    2004,
    2005,
    2006,
    2007,
    2008,
    2009,
    2010,
    2011,
    2012,
    2013,
    2014,
    2015,
    2016,
    2017,
    2018,
    2019,
    2020,
    2021,
    2022,
    2023,
    2024,
    2025,
    2026,
    2027,
    2028,
    2029,
    2030,
    2031,
    2032,
    2033,
    2034,
    2035,
    2036,
    2037,
    2038,
    2039,
    2040,
    2041,
    2042,
    2043,
    2044,
    2045,
    2046,
    2047,
    2048,
    2049,
    2050,
    2051,
    2052,
    2053,
    2054,
    2055,
    2056,
    2057,
    2058,
    2059,
    2060,
    2061,
    2062,
    2063,
    2064,
    2065,
    2066,
    2067,
    2068,
    2069,
    2070,
    2071,
    2072,
    2073,
    2074,
    2075,
    2076,
    2077,
    2078,
    2079,
    2080,
    2081,
    2082,
    2083,
    2084,
    2085,
    2086,
    2087,
    2088,
    2089,
    2090,
    2091,
    2092,
    2093,
    2094,
    2095,
    2096,
    2097,
    2098,
    2099,
    2100
  ];
  int yearIndex = yearList.indexOf(year + 1);
  return yearIndex;
}

int getDayFromIndex(int index) {
  List<int> dayList = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31
  ];
  if (index >= 1 && index <= dayList.length) {
    return dayList[index - 1];
  }
  return 99;
}

String? calculateWeeksAndDaysRemainingV3(
  int day,
  int month,
  int year,
) {
  // Ngày hiện tại
  final DateTime today = DateTime.now();

  // Ngày bắt đầu mang thai (ngày nhập vào)
  DateTime conceptionDate = DateTime(year, month, day);

  // Nếu ngày nhập vào quá 280 ngày trước thời điểm hiện tại hoặc sau ngày hiện tại, đặt mặc định là ngày hiện tại
  if (conceptionDate.isBefore(today.subtract(Duration(days: 280))) ||
      conceptionDate.isAfter(today.add(Duration(days: 1)))) {
    conceptionDate = today;
  }

  // Ngày dự sinh (280 ngày sau ngày bắt đầu mang thai)
  final DateTime dueDate = conceptionDate.add(Duration(days: 280));

  // Kiểm tra nếu ngày dự sinh đã qua
  if (dueDate.isBefore(today)) {
    return 'Ngày dự sinh đã qua'; // Nếu đã quá ngày dự sinh
  }

  // Tổng số ngày giữa ngày hiện tại và ngày dự sinh
  final int daysRemaining = dueDate.difference(today).inDays;

  // Tính số tuần và số ngày còn lại
  const int daysPerWeek = 7;
  final int remainingWeeks = daysRemaining ~/ daysPerWeek;
  final int remainingDays = daysRemaining % daysPerWeek;

  return '$remainingWeeks tuần $remainingDays ngày';
}

double caculateBmi(
  double weight,
  double height,
) {
  if (weight <= 0 || height <= 0) {
    throw ArgumentError("Cân nặng và chiều cao phải lớn hơn 0.");
  }

  double heightM = height / 100;

  // Tính BMI
  double bmi = weight / (heightM * heightM);

  // Trả về chỉ số BMI
  return double.parse(bmi.toStringAsFixed(1));
}

double? totalNutrient(
  double? protein,
  double? carbohydrate,
  double? fat,
) {
  var total = (protein ?? 0) + (carbohydrate ?? 0) + (fat ?? 0);
  return double.parse(total.toStringAsFixed(1));
}

double caculatePercentageNutrient(
  double value1,
  double value2,
) {
  double percentage = (value1 / value2) * 100;
  return double.parse(percentage.toStringAsFixed(1));
}

int? getMinuteInString(String? time) {
  if (time == null || time.isEmpty) {
    return 1;
  }

  try {
    final parts = time.split(':');
    return int.parse(parts[1]);
  } catch (e) {
    return null;
  }
}

String getMealNameInVietnamese(String mealName) {
  switch (mealName) {
    case 'Breakfast':
      return 'Bữa sáng';
    case 'Lunch':
      return 'Bữa trưa';
    case 'Dinner':
      return 'Bữa tối';
    case 'Snack1':
      return 'Bữa phụ 1';
    case 'Snack2':
      return 'Bữa phụ 2';
    case 'Snack3':
      return 'Bữa phụ 3';
    case 'Snack4':
      return 'Bữa phụ 4';
    default:
      return '';
  }
}

int getMonth(String dateString) {
  return int.parse(dateString.split('-')[1]);
}

int getDay(String dateString) {
  return int.parse(dateString.split('-')[2]);
}

int getYearFromIndexV2(int index) {
  List<int> yearsList = [
    1800,
    1801,
    1802,
    1803,
    1804,
    1805,
    1806,
    1807,
    1808,
    1809,
    1810,
    1811,
    1812,
    1813,
    1814,
    1815,
    1816,
    1817,
    1818,
    1819,
    1820,
    1821,
    1822,
    1823,
    1824,
    1825,
    1826,
    1827,
    1828,
    1829,
    1830,
    1831,
    1832,
    1833,
    1834,
    1835,
    1836,
    1837,
    1838,
    1839,
    1840,
    1841,
    1842,
    1843,
    1844,
    1845,
    1846,
    1847,
    1848,
    1849,
    1850,
    1851,
    1852,
    1853,
    1854,
    1855,
    1856,
    1857,
    1858,
    1859,
    1860,
    1861,
    1862,
    1863,
    1864,
    1865,
    1866,
    1867,
    1868,
    1869,
    1870,
    1871,
    1872,
    1873,
    1874,
    1875,
    1876,
    1877,
    1878,
    1879,
    1880,
    1881,
    1882,
    1883,
    1884,
    1885,
    1886,
    1887,
    1888,
    1889,
    1890,
    1891,
    1892,
    1893,
    1894,
    1895,
    1896,
    1897,
    1898,
    1899,
    1900,
    1901,
    1902,
    1903,
    1904,
    1905,
    1906,
    1907,
    1908,
    1909,
    1910,
    1911,
    1912,
    1913,
    1914,
    1915,
    1916,
    1917,
    1918,
    1919,
    1920,
    1921,
    1922,
    1923,
    1924,
    1925,
    1926,
    1927,
    1928,
    1929,
    1930,
    1931,
    1932,
    1933,
    1934,
    1935,
    1936,
    1937,
    1938,
    1939,
    1940,
    1941,
    1942,
    1943,
    1944,
    1945,
    1946,
    1947,
    1948,
    1949,
    1950,
    1951,
    1952,
    1953,
    1954,
    1955,
    1956,
    1957,
    1958,
    1959,
    1960,
    1961,
    1962,
    1963,
    1964,
    1965,
    1966,
    1967,
    1968,
    1969,
    1970,
    1971,
    1972,
    1973,
    1974,
    1975,
    1976,
    1977,
    1978,
    1979,
    1980,
    1981,
    1982,
    1983,
    1984,
    1985,
    1986,
    1987,
    1988,
    1989,
    1990,
    1991,
    1992,
    1993,
    1994,
    1995,
    1996,
    1997,
    1998,
    1999,
    2000,
    2001,
    2002,
    2003,
    2004,
    2005,
    2006,
    2007,
    2008,
    2009,
    2010,
    2011,
    2012,
    2013,
    2014,
    2015,
    2016,
    2017,
    2018,
    2019,
    2020,
    2021,
    2022,
    2023,
    2024,
    2025,
    2026,
    2027,
    2028,
    2029,
    2030,
    2031,
    2032,
    2033,
    2034,
    2035,
    2036,
    2037,
    2038,
    2039,
    2040,
    2041,
    2042,
    2043,
    2044,
    2045,
    2046,
    2047,
    2048,
    2049,
    2050,
    2051,
    2052,
    2053,
    2054,
    2055,
    2056,
    2057,
    2058,
    2059,
    2060,
    2061,
    2062,
    2063,
    2064,
    2065,
    2066,
    2067,
    2068,
    2069,
    2070,
    2071,
    2072,
    2073,
    2074,
    2075,
    2076,
    2077,
    2078,
    2079,
    2080,
    2081,
    2082,
    2083,
    2084,
    2085,
    2086,
    2087,
    2088,
    2089,
    2090,
    2091,
    2092,
    2093,
    2094,
    2095,
    2096,
    2097,
    2098,
    2099,
    2100
  ];

  if (index >= 1 && index < yearsList.length) {
    return yearsList[index - 1];
  }
  return 0;
}

String? calculatePregnantWeekV3(String dueDateString) {
  final DateTime dueDate = DateFormat('yyyy-MM-dd').parse(dueDateString);
  final DateTime currentDate = DateTime.now();
  final DateTime conceptionDate = dueDate.subtract(Duration(days: 280));
  final int daysPregnant = currentDate.difference(conceptionDate).inDays;

  if (daysPregnant < 0) {
    return 'Ngày dự sinh ở tương lai';
  }

  final int weeks = daysPregnant ~/ 7;
  final int days = daysPregnant % 7;

  return '${weeks} tuần ${days} ngày';
}

List<CalendarDayStruct> getCalendarForMonth(DateTime inputDate) {
  List<CalendarDayStruct> calendarDays = [];

  DateTime firstOfMonth = DateTime(inputDate.year, inputDate.month, 1);

  int daysToPreviousMonday = (firstOfMonth.weekday - DateTime.monday) % 7;
  DateTime startCalendarDay =
      firstOfMonth.subtract(Duration(days: daysToPreviousMonday));

  for (int i = 0; i < 35; i++) {
    DateTime currentDay = startCalendarDay.add(Duration(days: i));
    bool isPreviousMonth = currentDay.month < firstOfMonth.month ||
        (currentDay.month > firstOfMonth.month && firstOfMonth.month == 12);
    bool isNextMonth = currentDay.month > firstOfMonth.month ||
        (currentDay.month < firstOfMonth.month && firstOfMonth.month == 12);

    calendarDays.add(CalendarDayStruct(
        calendarDate: currentDay,
        isPreviousMonth: isPreviousMonth,
        isNextMonth: isNextMonth));
  }

  return calendarDays;
}

DateTime getNextMonthDateTime(DateTime inputDate) {
  int year = inputDate.year;
  int month = inputDate.month;

  if (month == 12) {
    year++;
    month = 1;
  } else {
    month++;
  }
  return DateTime(year, month);
}

DateTime getLastMonthDateTime(DateTime inputDate) {
  int year = inputDate.year;
  int month = inputDate.month;

  if (month == 1) {
    year--;
    month = 12;
  } else {
    month--;
  }
  return DateTime(year, month);
}

int caculateAge(String birthDateString) {
  // Chuyển đổi chuỗi ngày tháng thành đối tượng DateTime
  DateTime birthDate = DateTime.parse(birthDateString);

  // Lấy ngày hiện tại
  DateTime currentDate = DateTime.now();

  // Tính tuổi
  int age = currentDate.year - birthDate.year;

  // Điều chỉnh tuổi nếu ngày sinh chưa tới trong năm hiện tại
  if (currentDate.month < birthDate.month ||
      (currentDate.month == birthDate.month &&
          currentDate.day < birthDate.day)) {
    age--;
  }

  return age;
}

String formatDateToVietnamese(DateTime date) {
  int day = date.day;
  int month = date.month;

  // Tạo chuỗi kết quả với định dạng "dd Tháng M"
  String formattedDate = '$day Tháng $month';

  return formattedDate;
}

List<int> yearForBirthDay() {
  List<int> yearList = [];
  for (int i = 1800; i <= 2100; i++) {
    yearList.add(i);
  }
  return yearList;
}

int getYear(String dateString) {
  return int.parse(dateString.split('-')[0]);
}

String timeDifferenceInDays(String inputDateTime) {
  DateTime dateTime = DateTime.parse(inputDateTime);

  // Lấy thời gian hiện tại
  DateTime now = DateTime.now();

  // Tính toán số ngày giữa hai thời điểm
  Duration difference = now.difference(dateTime);
  int daysDifference = difference.inDays;

  // Trả về kết quả dạng "Cập nhật x ngày trước"
  return "Cập nhật $daysDifference ngày trước";
}

double? calculatePercentageChange(
  double? oldValue,
  double? newValue,
) {
  double percentageChange = ((newValue! - oldValue!) / oldValue) * 100;

  // Làm tròn phần trăm thay đổi đến 1 chữ số thập phân
  return double.parse(percentageChange.toStringAsFixed(1));
}

List<dynamic>? getItemsWithType(
  List<dynamic>? jsonList,
  int? typeValue,
) {
  if (jsonList == null) {
    return null;
  }

  // Tạo danh sách mới để chứa các phần tử có type = 0
  List<dynamic> itemsWithTypeZero = [];

  // Duyệt qua từng phần tử trong jsonList
  for (var item in jsonList) {
    // Kiểm tra nếu item có trường 'type' với giá trị là 0
    if (item['type'] == typeValue) {
      itemsWithTypeZero.add(item);
    }
  }

  // Nếu không có phần tử nào trong itemsWithTypeZero, thêm phần tử có giá trị 0
  if (itemsWithTypeZero.isEmpty) {
    itemsWithTypeZero.add({'value': 0});
  }

  return itemsWithTypeZero;
}

String convertDateToFormattedString(String inputDate) {
  List<String> dateParts = inputDate.split('/');

  // Lấy từng phần ngày, tháng, năm
  String day = dateParts[0].padLeft(2, '0'); // Đảm bảo ngày có 2 chữ số
  String month = dateParts[1].padLeft(2, '0'); // Đảm bảo tháng có 2 chữ số
  String year = dateParts[2]; // Giữ nguyên năm

  // Kết hợp lại thành định dạng "dd/MM/yyyy"
  return '$day/$month/$year';
}

bool? checkElementInList(
  List<DailyRecord>? items,
  String element,
) {
  if (items == null || items.isEmpty) {
    return false;
  }

  for (var item in items) {
    // Format lại item.date từ yyyy-MM-dd sang dd/MM/yyyy
    final formattedItemDate =
        DateFormat('dd/MM/yyyy').format(DateTime.parse(item.date));

    if (formattedItemDate == element) {
      // Nếu phần tử tìm thấy
      return true;
    }
  }

  // Nếu không tìm thấy phần tử
  return false;
}

int? getHourInString(String? time) {
  if (time == null || time.isEmpty) {
    return 1;
  }

  try {
    final parts = time.split(':');
    return int.parse(parts[0]);
  } catch (e) {
    return null;
  }
}

List<String> trimesterPicker() {
  return [
    "Tam cá nguyệt đầu tiên",
    "Tam cá nguyệt thứ 2",
    "Tam cá nguyệt thứ 3",
    "Trước khi sinh",
    "Sau khi sinh"
  ];
}

int? getCurrentDay() {
  final now = DateTime.now();

  // Return the day of the current date
  return now.day;
}

int? getCurrentMonth() {
  final now = DateTime.now();
  return now.month;
}

int? getCurrentYear() {
  final now = DateTime.now();
  return now.year;
}

List<String>? generateFormattedDateList() {
  // Define the start and end dates
  DateTime startDate = DateTime(2024, 1, 1);
  DateTime endDate = DateTime(2026, 12, 31);

  // List to hold formatted date strings
  List<String> formattedDates = [];

  // Helper function to map the day of the week to Vietnamese names
  String getVietnameseDayName(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Th 2'; // Monday
      case DateTime.tuesday:
        return 'Th 3'; // Tuesday
      case DateTime.wednesday:
        return 'Th 4'; // Wednesday
      case DateTime.thursday:
        return 'Th 5'; // Thursday
      case DateTime.friday:
        return 'Th 6'; // Friday
      case DateTime.saturday:
        return 'Th 7'; // Saturday
      case DateTime.sunday:
        return 'CN'; // Sunday
      default:
        return '';
    }
  }

  // Helper function to map the month to Vietnamese names
  String getVietnameseMonthName(int month) {
    return 'thg $month';
  }

  // Iterate through each day from start to end date
  for (DateTime date = startDate;
      date.isBefore(endDate) || date.isAtSameMomentAs(endDate);
      date = date.add(Duration(days: 1))) {
    // Get the day name and month name in Vietnamese
    String dayName = getVietnameseDayName(
        date.weekday); // Correctly gets the day of the week
    String day = date.day.toString().padLeft(2, '0');
    String monthName = getVietnameseMonthName(date.month);

    // Construct the formatted date string
    String formattedDate = '$dayName $day $monthName';

    // Add the formatted date to the list
    formattedDates.add(formattedDate);
  }

  return formattedDates;
}

int? getIndexForDate() {
  DateTime startDate = DateTime(2024, 1, 1);
  DateTime endDate = DateTime(2026, 12, 31);

  String getVietnameseDayName(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Th 2'; // Monday
      case DateTime.tuesday:
        return 'Th 3'; // Tuesday
      case DateTime.wednesday:
        return 'Th 4'; // Wednesday
      case DateTime.thursday:
        return 'Th 5'; // Thursday
      case DateTime.friday:
        return 'Th 6'; // Friday
      case DateTime.saturday:
        return 'Th 7'; // Saturday
      case DateTime.sunday:
        return 'CN'; // Sunday
      default:
        return '';
    }
  }

  String getVietnameseMonthName(int month) {
    return 'thg $month';
  }

  DateTime today = DateTime.now();

  String todayDayName = getVietnameseDayName(today.weekday);
  String todayDay = today.day.toString().padLeft(2, '0');
  String todayMonthName = getVietnameseMonthName(today.month);
  String todayFormattedDate = '$todayDayName $todayDay $todayMonthName';

  int index = 0;
  for (DateTime date = startDate;
      date.isBefore(endDate) || date.isAtSameMomentAs(endDate);
      date = date.add(Duration(days: 1))) {
    String dayName = getVietnameseDayName(date.weekday);
    String day = date.day.toString().padLeft(2, '0');
    String monthName = getVietnameseMonthName(date.month);
    String formattedDate = '$dayName $day $monthName';

    if (formattedDate == todayFormattedDate) {
      return index;
    }

    index++;
  }
  return 1;
}

String? uploadedFiletoImagePath(FFUploadedFile? imageUrl) {
  // Kiểm tra xem imageUrl có null hay không
  if (imageUrl == null) {
    return null; // Nếu không có hình ảnh, trả về null
  }

  // Lấy tên tệp từ FFUploadedFile
  String? fileName = imageUrl.name; // Tên tệp

  return fileName;
}

DateTime? getDateNow() {
  return DateTime.now();
}

String? getDateByIndex(
  int? index,
  List<String>? dateList,
) {
  if (dateList != null &&
      index != null &&
      index >= 0 &&
      index < dateList.length) {
    return dateList[index];
  } else {
    return "Hôm nay";
  }
}

List<String> generateFilterList() {
  return ["Tất cả", "An Toàn", "Không an toàn"];
}

List<dynamic> mapJson(
  List<dynamic> jsonList,
  int a,
  int b,
  double amount,
  bool isAdd,
) {
  Map<String, dynamic> firstElement = {
    'postProcessingAmount': amount,
    'name': 'Năng lượng',
    'nutritionId': 0,
    'conversionRate': 1.0,
    'amount': amount,
    'unitName': 'Kcal',
    'unitCode': 'Kcal',
    'fractionalQuantity': 1,
    'nutritionCode': 0
  };
  List<dynamic> filteredList = [];

  // Lọc các phần tử từ jsonList
  for (var item in jsonList) {
    if (item is Map<String, dynamic>) {
      var nutritionCodeDynamic = item['nutritionCode'];
      print(
          'Type of nutritionCodeDynamic: ${nutritionCodeDynamic.runtimeType}'); // Debug line

      int nutritionCode = 0;

      if (nutritionCodeDynamic is String) {
        nutritionCode = int.tryParse(nutritionCodeDynamic) ?? 0;
      } else if (nutritionCodeDynamic is int) {
        nutritionCode = nutritionCodeDynamic;
      }

      print('Nutrition Code: $nutritionCode'); // Debug line

      if (nutritionCode >= a && nutritionCode <= b) {
        filteredList.add(item);
      }
    }
  }

  // Thêm phần tử đầu tiên vào danh sách nếu isAdd là true
  if (isAdd) {
    filteredList.insert(0, firstElement);
  }
  return filteredList;
}

double? calculateAverageRating(List<int>? ratings) {
  if (ratings == null || ratings.isEmpty) {
    return 0; // Trả về null nếu danh sách không có giá trị hoặc rỗng
  }

  // Tính tổng các giá trị rating
  int total = ratings.reduce((a, b) => a + b);

  // Tính trung bình
  double average = total / ratings.length;

  return average;
}

int? calculateNumberOfRatings(List<int>? ratings) {
  return ratings?.length ?? 0;
}

double? calculateDifference(
  List<dynamic> jsonList,
  int index,
) {
  // Kiểm tra nếu danh sách không đủ phần tử hoặc chỉ mục không hợp lệ
  if (jsonList.length <= index || index < 0 || index + 1 >= jsonList.length) {
    return 0.0;
  }

  // Lấy phần tử tại chỉ mục và phần tử kế tiếp
  var firstItem = jsonList[index];
  var secondItem = jsonList[index + 1];

  // Kiểm tra nếu giá trị của phần tử tại chỉ mục hoặc phần tử kế tiếp là null
  if (firstItem['value'] == null || secondItem['value'] == null) {
    return 0.0;
  }

  // Tính toán sự khác biệt giữa giá trị của phần tử tại chỉ mục và phần tử kế tiếp
  double firstValue = (firstItem['value'] as num).toDouble();
  double secondValue = (secondItem['value'] as num).toDouble();

  double difference = firstValue - secondValue;
  return double.parse(difference.toStringAsFixed(1));
}

List<int> calculateDateDifferences(List<String> dateList) {
  if (dateList.isEmpty) {
    return [];
  }

  List<int> differences = [0];
  int cumulativeDifference = 0;

  // Duyệt qua danh sách và tính khoảng cách giữa các ngày liên tiếp
  for (int i = 0; i < dateList.length - 1; i++) {
    // Chuyển đổi chuỗi ngày thành kiểu DateTime
    DateTime firstDate = DateTime.parse(dateList[i]);
    DateTime secondDate = DateTime.parse(dateList[i + 1]);

    // Tính số ngày chênh lệch giữa hai ngày liên tiếp
    int difference = firstDate.difference(secondDate).inDays.abs();
    cumulativeDifference += difference;

    // Thêm kết quả vào danh sách
    differences.add(cumulativeDifference);
  }

  return differences;
}

List<int> sampleData() {
  return [];
}

String? calculateDueDateV2(
  int day,
  int month,
  int year,
) {
  try {
    DateTime today = DateTime.now();
    DateTime inputDate = DateTime(year, month, day);

    // Nếu ngày nhập vào quá khứ hơn 280 ngày so với ngày hiện tại hoặc sau ngày hiện tại
    if (inputDate.isBefore(today.subtract(Duration(days: 280))) ||
        inputDate.isAfter(today)) {
      // Đặt ngày nhập vào là ngày hiện tại
      inputDate = today;
    }

    // Tính ngày dự sinh bằng cách thêm 280 ngày kể từ ngày đã xử lý
    DateTime dueDate = inputDate.add(Duration(days: 280));

    // Định dạng ngày dưới dạng yyyy-MM-dd
    String formattedDate = DateFormat('yyyy-MM-dd').format(dueDate);

    return formattedDate;
  } catch (e) {
    // Xử lý lỗi nếu có
    return DateFormat('yyyy-MM-dd')
        .format(DateTime.now()); // Trả về ngày hiện tại nếu có lỗi
  }
}

List<String> weekPostPicker() {
  List<String> weeks = [];

  for (int i = 1; i <= 42; i++) {
    weeks.add('Tuần $i');
  }

  return weeks;
}

List<double>? convertToDoubleList(List<String>? intList) {
  return intList?.map((number) => double.tryParse(number) ?? 0.0).toList();
}
