const data = [
  {
    type: 'banner',
    data: [
      require('assets/image/banner.png'),
      require('assets/image/banner.png'),
      require('assets/image/banner.png'),
    ],
  },
  {
    type: 'menu',
    data: [
      {
        key: 'class',
        icon: require('assets/icon/menu-class.png'),
        title: '我的课表',
      },
      {
        key: 'homework',
        icon: require('assets/icon/menu-homework.png'),
        title: '课堂作业',
      },
      {
        key: 'attend',
        icon: require('assets/icon/menu-attend.png'),
        title: '课堂考勤',
      },
      {
        key: 'reading',
        icon: require('assets/icon/menu-reading.png'),
        title: '每日阅读',
      },
      {
        key: 'result',
        icon: require('assets/icon/menu-result.png'),
        title: '我的成绩',
      },
      {
        key: 'remark',
        icon: require('assets/icon/menu-remark.png'),
        title: '课堂反馈',
      },
    ],
  },
  {
    type: 'hot',
    data: [
      {
        classId: '1',
        imgUrl: require('assets/image/class2.png'),
        name: '数学趣味课堂',
        content: '名师教学、保证高分、一对一辅导',
      },
      {
        classId: '2',
        imgUrl: require('assets/image/class1.png'),
        name: '美术趣味课堂',
        content: '名师教学、保证高分、一对一辅导',
      },
      {
        classId: '3',
        imgUrl: require('assets/image/class1.png'),
        name: '美术趣味课堂',
        content: '名师教学、保证高分、一对一辅导',
      },
    ],
  },
];

export default data;
