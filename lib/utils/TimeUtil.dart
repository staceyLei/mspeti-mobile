class TimeUtil {
// 获取月份具体天数
  static List<int> dateList = [31, -1, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
// 星期几
  static List<String> weekList = ['日', '一', '二', '三', '四', '五', '六'];

// 获取具体年份月份天数
  static int getDaysNum(int year, int month) {
    if (month == DateTime.february) {
      return year % 4 == 0 ? 29 : 28;
    } else {
      return dateList[month - 1];
    }
  }

// 获取具体年份月份要渲染的数组
  static List<int> getMonthDays(int year, int month) {
// 获取该月要空出的天数
    int weekDay = DateTime(year, month, 1).weekday % 7;
    List<int> firstEmpty = List.filled(weekDay, -1);
    int monthDay = getDaysNum(year, month);
    List<int> monthDays = List.generate(monthDay, (index) => index + 1);
    int lastDay =
        (weekDay + monthDay) % 7 == 0 ? 0 : 7 - (weekDay + monthDay) % 7;
    return []
      ..addAll(firstEmpty)
      ..addAll(monthDays)
      ..addAll(List.filled(lastDay, -1));
  }

// 获取周几
  static String getWeekDay(int weekDay) {
    if (weekDay == 7) {
      return '周日';
    } else {
      return '周${weekList[weekDay]}';
    }
  }

// 获取早/中/下午/晚上
  static String getTime(int hours) {
    if (hours > 0 && hours < 11) {
      return '上午';
    } else if (hours >= 11 && hours <= 13) {
      return '中午';
    } else if (hours > 13 && hours <= 18) {
      return '下午';
    } else {
      return '晚上';
    }
  }
}
